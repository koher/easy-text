public struct TextSlice {
    internal var characters: ArraySlice<Character>
    
    internal init(_ characters: ArraySlice<Character>) {
        self.characters = characters
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
