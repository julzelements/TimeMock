//
//  Stanza.swift
//  TimeMock
//
//  Created by Julian Scharf on 10/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import Foundation

class Stanza {
    
    var index: Int!
    var startTime: String!
    var endTime: String!
    
    init(stanzaBlob: String) {
        index = scanForIndex(stanzaBlob: stanzaBlob)
        startTime = scanForTimes(stanzaBlob: stanzaBlob)[0]
        endTime = scanForTimes(stanzaBlob: stanzaBlob)[1]
    }
    
    private func scanForIndex(stanzaBlob: String) -> Int {
        
    let regex = try! NSRegularExpression(pattern: "^[0-9]+", options: .caseInsensitive)
    
    let match = regex.matches(in: stanzaBlob, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, stanzaBlob.characters.count))
    let i = match.first
    
    let indexString = (stanzaBlob as NSString).substring(with: (i?.range)!)
        if let indexInt = Int(indexString) {
            return indexInt
        } else {
            return 0
        }
    }
    
    private func scanForTimes(stanzaBlob: String) -> [String] {
        let timeStampPattern = "\\d\\d:\\d\\d:\\d\\d,\\d\\d\\d"
        let timeStampRegex = try! NSRegularExpression(pattern: timeStampPattern,
                                                      options: .caseInsensitive)
        
        let matches = timeStampRegex.matches(in: stanzaBlob,
                                             range: NSMakeRange(0, stanzaBlob.utf16.count))
        
        let times = matches.map { result -> String in
            let timesRange = result.rangeAt(0)
            let start = String.UTF16Index(timesRange.location)
            let end = String.UTF16Index(timesRange.location + timesRange.length)
            let time = String(stanzaBlob.utf16[start..<end])!
            
            return time
        }
        return times
    }
}
