//
//  StanzaTests.swift
//  TimeMock
//
//  Created by Julian Scharf on 11/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest
@testable import TimeMock

class StanzaTests: XCTestCase {
    var stanza: Stanza!
    
    
    override func setUp() {
        super.setUp()
        let stanzaBlob = "28\n00:01:46,120 --> 00:01:49,320\n- But you are a kid, you are 18\n- This is my chance to prove myself."
        stanza = Stanza(stanzaBlob: stanzaBlob)
    }
    
    func testStanzaShouldHaveIndexOf28() {
        
        let expectedIndex: Int = 28
        XCTAssertEqual(expectedIndex, stanza.index)
    }
    
    func testStanzaShouldHaveStartTime() {
        let expectedStartTime = "00:01:46,120"
        XCTAssertEqual(expectedStartTime, stanza.startTime)
    }
    
    func testStanzaShouldHaveEndTime() {
        let expectedEndTime = "00:01:49,320"
        XCTAssertEqual(expectedEndTime, stanza.endTime)
    }
    
}
