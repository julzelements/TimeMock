//
//  SubtitleIOTests.swift
//  TimeMock
//
//  Created by Julian Scharf on 13/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest
@testable import TimeMock

class SubtitleIOTests: XCTestCase {
    
    func testSouldReadTestStringFromHelperClass() {
        let mySimpleTestString = TestConstants.mySimpleTestString
        XCTAssertEqual("testString", mySimpleTestString.rawValue)
    }
    
    func testShouldGetTestTextFromTestFileInBundle() {
        let testString = SubtitleIO.getRawStringFromFileInBundle(fileName: "test", fileExtension: "txt")
        XCTAssertEqual("test", testString)
    }
    
    func testSubsFromBundleShouldEqualSubsInTestConstants() {
        let testString = SubtitleIO.getRawStringFromFileInBundle(fileName: "spiderman", fileExtension: "srt")
        let spiderManSRTText = TestConstants.spiderManSRTString.rawValue
        XCTAssertEqual(spiderManSRTText, testString)
    }
    
    func testShouldGetBadURLErrorMessageWhenTryingToGetNonExistentFileFromBundle() {
        let expectedError = "could not obtain URL"
        let request = SubtitleIO.getRawStringFromFileInBundle(fileName: "foo", fileExtension: "bar")
        XCTAssertEqual(expectedError, request)
    }

    func testShouldGetBadURLErrorMessageWhenTryingToReadAMOVFileAsAString() {
        let expectedError = "could not read contents of URL as a string"
        let request = SubtitleIO.getRawStringFromFileInBundle(fileName: "spiderman", fileExtension: "mov")
        XCTAssertEqual(expectedError, request)
    }
}
