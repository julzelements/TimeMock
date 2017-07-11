//
//  MockTime.swift
//  TimeMock
//
//  Created by Julian Scharf on 8/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

class MyTimeDummy: ITime {
    
    var secondsSince1970: Double
    
    init(mockedTime: Double) {
        secondsSince1970 = mockedTime
    }
}
