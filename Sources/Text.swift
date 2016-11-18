public struct Text {
    fileprivate var characters: [Character]
    
    public init(_ string: String) {
        characters = Array(string.characters)
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
}

extension Text {
    public init(_ textSlice: TextSlice) {
        characters = Array(textSlice.characters)
    }
}

extension Text {
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

    public subscript(bounds: CountableRange<Int>) -> TextSlice {
        get {
            return TextSlice(characters[bounds])
        }
        set {
            characters[bounds] = newValue.characters
        }
    }
    
    public subscript(bounds: CountableClosedRange<Int>) -> TextSlice {
        get {
            return TextSlice(characters[bounds])
        }
        set {
            characters[bounds] = newValue.characters
        }
    }
}

extension Text: Sequence {
    public func makeIterator() -> IndexingIterator<[Character]> {
        return characters.makeIterator()
    }
}

extension Text: CustomStringConvertible {
    public var description: String {
        return String(characters)
    }
}

extension Text: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "Text(\(description.debugDescription))"
    }
}

extension Text: Equatable {}

public func ==(lhs: Text, rhs: Text) -> Bool {
    return lhs.characters == rhs.characters
}

extension Text: Hashable {
    public var hashValue: Int {
        return self.description.hashValue
    }
}

extension Text: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }
}
