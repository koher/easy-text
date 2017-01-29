import XCTest
@testable import EasyText

class TextTests: XCTestCase {
    func testSubscript() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a[0], "a")
            XCTAssertEqual(a[1], "b")
            XCTAssertEqual(a[2], "c")
        }
    }
    
    func testSubscriptRange() {
        do {
            let a: Text = "abcdefg"
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
            let a: Text = "abcdefg"
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
            let a: Text = "abc"
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
            let a: Text = ""
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
            let a: Text = "abc"
            XCTAssertEqual(a.count, 3)
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.count, 0)
        }
    }
    
    func testStartIndex() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a.startIndex, 0)
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.startIndex, 0)
        }
    }
    
    func testEndIndex() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a.endIndex, 3)
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.endIndex, 0)
        }
    }
    
    func testFirst() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a.first, "a")
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.first, nil)
        }
    }
    
    func testLast() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a.last, "c")
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.last, nil)
        }
    }
    
    func testDescription() {
        do {
            let a: Text = "abc"
            XCTAssertEqual(a.description, "abc")
        }
        do {
            let a: Text = ""
            XCTAssertEqual(a.description, "")
        }
    }
    
    func testMakeIterator() {
        do {
            let a: Text = "abc"
            var iterator = a.makeIterator()
            XCTAssertEqual(iterator.next(), "a")
            XCTAssertEqual(iterator.next(), "b")
            XCTAssertEqual(iterator.next(), "c")
            XCTAssertEqual(iterator.next(), nil)
        }
        do {
            let a: Text = "abc"
            var characters = [Character]()
            for c in a {
                characters.append(c)
            }
            XCTAssertEqual(characters, ["a", "b", "c"])
        }
    }
}
