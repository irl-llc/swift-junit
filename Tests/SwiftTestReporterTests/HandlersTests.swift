import Foundation
@testable import SwiftTestReporter
import XCTest

final class HandlersTests: XCTestCase {
    private func getTemporaryFilePath() -> String {
        let temporaryDir = NSTemporaryDirectory()
        let fileName = UUID().uuidString
        return "\(temporaryDir)\(fileName)"
    }

    func testFileHandlerShouldGetResultPathFromEnvironment() {
        let resultPath = getTemporaryFilePath()
        XCTAssertFalse(FileManager.default.fileExists(atPath: resultPath))
        setenv("XML_OUTPUT_FILE", resultPath, 1)
        fileHandler("test")
        XCTAssertTrue(FileManager.default.fileExists(atPath: resultPath))
    }

    static var allTests = [
        ("testFileHandlerShouldGetResultPathFromEnvironment", testFileHandlerShouldGetResultPathFromEnvironment)
    ]
}
