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
    
    var testStanza28: Stanza!
    var subtitles: [Int: Stanza]!
    
    override func setUp() {
        super.setUp()
        testStanza28 = Stanza(stanzaBlob: TestConstants.stanzaBlobIndex28.rawValue)
        subtitles = SubtitleMaker.makeSubs(rawSRTString: TestConstants.spiderManSRTStringWithLineReturns.rawValue)
    }
    
    func testInitializingSubtitleShouldCreateStanza28Correctly() {
        let stanza28 = subtitles[28]
        XCTAssertTrue(stanza28! == testStanza28)
    }
    
    
}
