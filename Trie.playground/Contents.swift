import UIKit

class TrieNode<T: Hashable> {
    typealias Node = TrieNode<T>
    
    var value: T?
    var isTerminating = false
    var children: [T: Node] = [:]
    weak var parent: Node?
    
    var isLeaf: Bool {
        return children.count == 0
    }
    
    init(value: T? = nil, parent: Node? = nil) {
        self.value = value
        self.parent = parent
    }
    
    @discardableResult func add(child: T) -> Node {
        if let childNode = children[child] {
            return childNode
        } else {
            let newNode = Node(value: child, parent: self)
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
    
    public var count: Int {
        return wordCount
    }
    
    public var isEmpty: Bool {
        return wordCount == 0
    }
    
    public var words: [String] {
        return wordsInSubtrie(rootNode: root, partialWord: "")
    }
    
    public var description: String {
        return root.description
    }
    
    fileprivate let root: Node
    fileprivate var wordCount: Int
    
    public init() {
        root = Node()
        wordCount = 0
    }
}

// MARK: - Adds methods: insert, remove, contains
extension Trie {
    
    mutating func insert(_ word: String) {
        guard !word.isEmpty else { return }
        var currentNode = root
        
        for character in word.lowercased() {
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                currentNode = currentNode.add(child: character)
            }
        }
        
        guard !currentNode.isTerminating else {
            return
        }
        wordCount += 1
        currentNode.isTerminating = true
    }
    
    func contains(_ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        var currentNode = root
        
        for character in word.lowercased() {
            guard let childNode = currentNode.children[character] else {
                return false
            }
            currentNode = childNode
        }
        return currentNode.isTerminating
    }
    
    mutating func remove(word: String) {
        guard !word.isEmpty, let terminalNode = findTerminalNodeOf(word: word) else { return }
       
        if terminalNode.isLeaf {
            deleteNodesForWordEndingWith(terminalNode: terminalNode)
        } else {
            terminalNode.isTerminating = false
        }
        wordCount -= 1
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
    
    func findTerminalNodeOf(word: String) -> Node? {
        if let lastNode = findLastNodeOf(word: word) {
            return lastNode.isTerminating ? lastNode : nil
        }
        return nil
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
    
    func deleteNodesForWordEndingWith(terminalNode: Node) {
        var lastNode = terminalNode
        var character = lastNode.value
        while lastNode.isLeaf, let parentNode = lastNode.parent {
            lastNode = parentNode
            lastNode.children[character!] = nil
            character = lastNode.value
            if lastNode.isTerminating {
                break
            }
        }
    }
}

var trie = Trie()
trie.insert("Cute")
trie.contains("cute")
trie.contains("Cut")
trie.insert("cut")
trie.contains("Cut")
trie.insert("Cat")
trie.findWordsWithPrefix(prefix: "Cu")
trie.words
