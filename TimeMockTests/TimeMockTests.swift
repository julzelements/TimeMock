//
//  TimeMockTests.swift
//  TimeMockTests
//
//  Created by Julian Scharf on 3/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import XCTest
@testable import TimeMock

class TimeMockTests: XCTestCase {
    
//    func testGetTimeInSecondsSince1970() {
//        var start = NSDate.timeIntervalSinceReferenceDate + NSTimeIntervalSince1970
//        for _ in 1...100 {
//        let end = NSDate.timeIntervalSinceReferenceDate + NSTimeIntervalSince1970
//        print("\(end - start)")
//            start = end
//        }
//        XCTAssert(true)
//    }
    
    func testDummyTimeShouldBe2400Seconds() {
        let expectedTime: Double = 2400
        let dummyTime = MyTimeDummy(mockedTime: expectedTime)
        XCTAssert(dummyTime.secondsSince1970 == expectedTime)
        
    }
    
}
