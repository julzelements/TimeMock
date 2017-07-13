//
//  SubtitleTests.swift
//  TimeMock
//
//  Created by Julian Scharf on 10/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest
@testable import TimeMock

class SubtitleTests: XCTestCase {
    
    var testStanza: Stanza!
    var subtitles: Subtitles!
    
    override func setUp() {
        super.setUp()
        testStanza = Stanza(stanzaBlob: TestConstants.stanzaBlobIndex28.rawValue)
        subtitles = Subtitles(rawSRT: TestConstants.spiderManSRTString.rawValue)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitial() {
        XCTAssert(true)
    }
    
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
    
    func testShouldCreateStanza28Correctly() {
        
    }
    
    
}
