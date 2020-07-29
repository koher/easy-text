public protocol TextProtocol: Sequence, CustomStringConvertible, CustomDebugStringConvertible, ExpressibleByStringLiteral {
    subscript(index: Int) -> Character { get set }
    
    var count: Int { get }
    var startIndex: Int { get }
    var endIndex: Int { get }
    var first: Character? { get }
    var last: Character? { get }

    subscript(bounds: Range<Int>) -> TextSlice { get set }
    subscript(bounds: ClosedRange<Int>) -> TextSlice { get set }
}
