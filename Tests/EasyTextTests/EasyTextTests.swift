import XCTest
@testable import EasyText

class EasyTextTests: XCTestCase {
    func testExample() {
        var text: Text = "👪ABCDEFG👍"
        
        print(text[0]) // "👪"
        print(text[1...3]) // "ABC"
        print(text.last!) // "👍"
        print(text.count) // 9

        /**/XCTAssertEqual(text[0], "👪")
        /**/XCTAssertEqual(Text(text[1...3]), "ABC")
        /**/XCTAssertEqual(text.last!, "👍")
        /**/XCTAssertEqual(text.count, 9)

        text[0] = "😃"
        print(text[0]) // "😃"
        
        for c in text {
            print(c) // "😃", "A", "B", "C", "D", "E", "F", "G", "👍"
        }

        /**/XCTAssertEqual(text[0], "😃")

        let string = String(text)
        print(string) // "😃ABCDEFG👍"
        
        /**/XCTAssertEqual(string, "😃ABCDEFG👍")
    }

    static var allTests : [(String, (EasyTextTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
