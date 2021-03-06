public struct Text: TextProtocol {
    internal private(set) var characters: [Character]
    
    public init(_ string: String) {
        characters = Array(string)
    }
}

extension Text {
    public init(_ textSlice: TextSlice) {
        characters = Array(textSlice.characters)
    }
}

extension Text: Sequence {
    public func makeIterator() -> IndexingIterator<[Character]> {
        return characters.makeIterator()
    }
}

extension Text: Collection {
    public typealias SubSequence = TextSlice
    
    public subscript(index: Int) -> Character {
        get {
            return characters[index]
        }
        set {
            characters[index] = newValue
        }
    }
    
    public var startIndex: Int {
        return characters.startIndex
    }
    
    public var endIndex: Int {
        return characters.endIndex
    }
}

extension Text: RandomAccessCollection {}

extension Text: MutableCollection {}

extension Text: RangeReplaceableCollection {
    public init() {
        self.init("")
    }
    
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

extension Text: Equatable, Hashable {}

extension Text: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}
