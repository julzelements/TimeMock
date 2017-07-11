//
//  MyTime.swift
//  TimeMock
//
//  Created by Julian Scharf on 8/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

class MyTime: ITime {
    var secondsSince1970: Double  {
        return NSDate.timeIntervalSinceReferenceDate + NSTimeIntervalSince1970
    }
}
