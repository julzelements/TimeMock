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
    var events: [SubtitleEvent]!
    
    override func setUp() {
        super.setUp()
        testStanza28 = Stanza(stanzaBlob: TestConstants.stanzaBlobIndex28.rawValue)
        subtitles = SubtitleMaker.makeSubs(rawSRTString: TestConstants.spiderManSRTStringWithLineReturns.rawValue)
        events = SubtitleMaker.getEvents(subs: subtitles)
    }
    
    func testInitializingSubtitleShouldCreateStanza28Correctly() {
        let stanza28 = subtitles[28]
        XCTAssertTrue(stanza28! == testStanza28)
    }
    
    func testEventMakerShouldCreateEndEventForStanza28() {
        let endTime = 60.0 + 49.0 + 0.320 //"00:01:49,320"
        let endEvent = SubtitleEvent(time: endTime, text: "")
        XCTAssert(events.contains(endEvent))
    }
    
    func testEventMakerShouldCreateStartEventForStanza28() {
        let startTime = 60.0 + 46.0 + 0.120 //"00:01:46,120"
        let startEvent = SubtitleEvent(time: startTime, text: "- But you are a kid.\n- This is my chance to prove myself.")
        XCTAssert(events.contains(startEvent))
    }
    
    
}
