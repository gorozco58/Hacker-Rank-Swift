import UIKit

class TrieNode<T: Hashable> {
    var value: T?
    var isTerminating = false
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    @discardableResult func add(child: T) -> TrieNode<T> {
        if let childNode = children[child] {
            return childNode
        } else {
            let newNode = TrieNode(value: child, parent: self)
            children[child] = newNode
            return newNode
        }
    }
    
    var description: String {
        let valueString = value == nil ? " " : String(describing: value!)
        return "value: " + valueString +
            ", isTerminating: " + String(describing: isTerminating) +
            ", children: " + String(describing: children.keys) +
            "\n" + children.map { $0.value.description }.reduce("") { $0 + $1 }
    }
}

struct Trie {
    typealias Node = TrieNode<Character>
    let root: Node
    
    init() {
        root = Node()
    }
    
    var description: String {
        return root.description
    }
}

//Basics
extension Trie {
    
    func insert(_ word: String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        
        for (currentIndex, character) in word.lowercased().enumerated() {
            
            if let child = currentNode.children[character] {
                currentNode = child
            } else {
                currentNode = currentNode.add(child: character)
            }
            
            if currentIndex == word.count - 1 {
                currentNode.isTerminating = true
            }
        }
    }
    
    func contains(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        let characters = word.lowercased().map { $0 }
        var currentIndex = 0
        
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        return currentIndex == characters.count && currentNode.isTerminating
    }
    
    func findWordsWithPrefix(prefix: String) -> [String] {
        var words = [String]()
        let prefixLowerCased = prefix.lowercased()
        if let lastNode = findLastNodeOf(word: prefixLowerCased) {
            if lastNode.isTerminating {
                words.append(prefixLowerCased)
            }
            for childNode in lastNode.children.values {
                let childWords = wordsInSubtrie(rootNode: childNode, partialWord: prefixLowerCased)
                words += childWords
            }
        }
        return words
    }
}

private extension Trie {
    
    func findLastNodeOf(word: String) -> Node? {
        var currentNode = root
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return nil
            }
            currentNode = childNode
        }
        return currentNode
    }
    
    func wordsInSubtrie(rootNode: Node, partialWord: String) -> [String] {
        var subtrieWords = [String]()
        var previousLetters = partialWord
        if let value = rootNode.value {
            previousLetters.append(value)
        }
        if rootNode.isTerminating {
            subtrieWords.append(previousLetters)
        }
        for childNode in rootNode.children.values {
            let childWords = wordsInSubtrie(rootNode: childNode, partialWord: previousLetters)
            subtrieWords += childWords
        }
        return subtrieWords
    }
}

let trie = Trie()
trie.insert("Cute")
trie.contains("cute")
trie.contains("Cut")
trie.insert("cut")
trie.contains("Cut")
trie.insert("Cat")
trie.findWordsWithPrefix(prefix: "C")
