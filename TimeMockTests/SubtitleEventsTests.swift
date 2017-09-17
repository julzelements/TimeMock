//
//  SubtitleEventsTests.swift
//  TimeMockTests
//
//  Created by Julian Scharf on 17/9/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest

class SubtitleEventsTests: XCTestCase {
    var ironManBlob: String!
    
    override func setUp() {
        super.setUp()
        ironManBlob = SubtitleIO.getRawStringFromFileInBundle(fileName: "IronMan", fileExtension: "srt")
    }

    func testSubscriptTest() {
        let events = SubtitleEvents(rawSRTString: ironManBlob)
        print(events[0])
        print(events[1])
    }
    
}
