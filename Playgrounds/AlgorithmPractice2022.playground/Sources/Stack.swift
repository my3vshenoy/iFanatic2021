import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []
    public init() {}
    
    public init(_ elements: [Element]) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        """
    -----top-----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -------------
    """
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    // Get the top of stack without deleting values
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        storage.isEmpty
        // Or: peek() == nil
    }
}
