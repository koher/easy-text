public struct TextSlice: TextProtocol {
    internal var characters: ArraySlice<Character>
    
    internal init(_ characters: ArraySlice<Character>) {
        self.characters = characters
    }
    
    public init(_ text: Text) {
        self.init(ArraySlice(text.characters))
    }
    
    public subscript(index: Int) -> Character {
        get {
            return characters[index]
        }
        set {
            characters[index] = newValue
        }
    }
    
    public var count: Int {
        return characters.count
    }
    
    public var startIndex: Int {
        return characters.startIndex
    }
    
    public var endIndex: Int {
        return characters.endIndex
    }
    
    public var first: Character? {
        return characters.first
    }
    
    public var last: Character? {
        return characters.last
    }
}

extension TextSlice {
    public subscript(bounds: Range<Int>) -> TextSlice {
        get {
            return TextSlice(characters[bounds])
        }
        set {
            characters[bounds] = newValue.characters
        }
    }
    
    public subscript(bounds: ClosedRange<Int>) -> TextSlice {
        get {
            return TextSlice(characters[bounds])
        }
        set {
            characters[bounds] = newValue.characters
        }
    }
}

extension TextSlice: Sequence {
    public func makeIterator() -> IndexingIterator<ArraySlice<Character>> {
        return characters.makeIterator()
    }
}

extension TextSlice: CustomStringConvertible {
    public var description: String {
        return String(characters)
    }
}

extension TextSlice: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "TextSlice(\(description.debugDescription))"
    }
}

extension TextSlice: Equatable, Hashable {}

extension TextSlice: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(Text(value))
    }
}
