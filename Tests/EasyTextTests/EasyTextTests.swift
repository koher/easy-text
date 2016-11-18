import XCTest
@testable import EasyText

class EasyTextTests: XCTestCase {
    func testExample() {
        var text: Text = "ABCDEFG"
        
        print(text[0]) // "A"
        print(text[1...3]) // "BCD"
        print(text.count) // 7

        /**/XCTAssertEqual(text[0], "A")
        /**/XCTAssertEqual(Text(text[1...3]), "BCD")
        /**/XCTAssertEqual(text.count, 7)

        text[0] = "Z"
        print(text[0]) // "Z"
        
        for c in text {
            print(c) // "Z", "B", "C", "D", "E", "F", "G"
        }

        /**/XCTAssertEqual(text[0], "Z")

        let string = String(text)
        print(string) // "ZBCDEFG"
        
        /**/XCTAssertEqual(string, "ZBCDEFG")
    }

    static var allTests : [(String, (EasyTextTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
