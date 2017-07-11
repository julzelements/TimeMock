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
    var stanzaBlob: String!
    
    
    override func setUp() {
        super.setUp()
        stanzaBlob = "28\n00:01:46,120 --> 00:01:49,320\n- But you are a kid, you are 18\n- This is my chance to prove myself."
    }
    
    func testStanzaShouldHaveIndexOf28() {
        let myStanza = Stanza(stanzaBlob: stanzaBlob)
        let expectedIndex: Int = 28
        XCTAssertEqual(expectedIndex, myStanza.index)
    }
    
}
