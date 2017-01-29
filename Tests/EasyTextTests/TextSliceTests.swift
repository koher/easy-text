import XCTest
@testable import EasyText

class TextSliceTests: XCTestCase {
    func testSubscript() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a[2], "c")
            XCTAssertEqual(a[3], "d")
            XCTAssertEqual(a[4], "e")
        }
    }
    
    func testSubscriptRange() {
        do {
            let a: TextSlice = Text("abcdefg")[1..<6]
            let b: TextSlice = a[2..<5]
            XCTAssertEqual(b[2], "c")
            XCTAssertEqual(b[3], "d")
            XCTAssertEqual(b[4], "e")
            XCTAssertEqual(b.description, "cde")
            XCTAssertEqual(b.count, 3)
            XCTAssertEqual(b.startIndex, 2)
            XCTAssertEqual(b.endIndex, 5)
            XCTAssertEqual(b.first, "c")
            XCTAssertEqual(b.last, "e")
        }
        do {
            let a: TextSlice = Text("abcdefg")[1..<7]
            let b: TextSlice = a[2...5]
            XCTAssertEqual(b[2], "c")
            XCTAssertEqual(b[3], "d")
            XCTAssertEqual(b[4], "e")
            XCTAssertEqual(b[5], "f")
            XCTAssertEqual(b.description, "cdef")
            XCTAssertEqual(b.count, 4)
            XCTAssertEqual(b.startIndex, 2)
            XCTAssertEqual(b.endIndex, 6)
            XCTAssertEqual(b.first, "c")
            XCTAssertEqual(b.last, "f")
        }
        do {
            let a: TextSlice = Text("abc")[0..<3]
            let b: TextSlice = a[0..<3]
            XCTAssertEqual(b[0], "a")
            XCTAssertEqual(b[1], "b")
            XCTAssertEqual(b[2], "c")
            XCTAssertEqual(b.description, "abc")
            XCTAssertEqual(b.count, 3)
            XCTAssertEqual(b.startIndex, 0)
            XCTAssertEqual(b.endIndex, 3)
            XCTAssertEqual(b.first, "a")
            XCTAssertEqual(b.last, "c")
        }
        do {
            let a: TextSlice = Text("")[0..<0]
            let b: TextSlice = a[0..<0]
            XCTAssertEqual(b.description, "")
            XCTAssertEqual(b.count, 0)
            XCTAssertEqual(b.startIndex, 0)
            XCTAssertEqual(b.endIndex, 0)
            XCTAssertEqual(b.first, nil)
            XCTAssertEqual(b.last, nil)
        }
    }
    
    func testCount() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.count, 3)
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.count, 0)
        }
    }
    
    func testStartIndex() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.startIndex, 2)
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<2]
            XCTAssertEqual(a.startIndex, 2)
        }
    }
    
    func testEndIndex() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.endIndex, 5)
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<2]
            XCTAssertEqual(a.endIndex, 2)
        }
    }
    
    func testFirst() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.first, "c")
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<2]
            XCTAssertEqual(a.first, nil)
        }
    }
    
    func testLast() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.last, "e")
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<2]
            XCTAssertEqual(a.last, nil)
        }
    }
    
    func testDescription() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            XCTAssertEqual(a.description, "cde")
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<2]
            XCTAssertEqual(a.description, "")
        }
    }
    
    func testMakeIterator() {
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            var iterator = a.makeIterator()
            XCTAssertEqual(iterator.next(), "c")
            XCTAssertEqual(iterator.next(), "d")
            XCTAssertEqual(iterator.next(), "e")
            XCTAssertEqual(iterator.next(), nil)
        }
        do {
            let a: TextSlice = Text("abcdefg")[2..<5]
            var characters = [Character]()
            for c in a {
                characters.append(c)
            }
            XCTAssertEqual(characters, ["c", "d", "e"])
        }
    }
}
