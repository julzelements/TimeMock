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
    var lines: [String]!
    var splitBlob: [String]!
    
    init(stanzaBlob: String) {
        splitBlob = splitBlobIntoLines(stanzaBlob: stanzaBlob)
        index = scanForIndex(stanzaBlob: splitBlob[0])
        let tupleOfTimes = scanForTimes(stanzaBlob: splitBlob[1])
        startTime = tupleOfTimes.startTime
        endTime = tupleOfTimes.endTime
        lines = scanForLines(splitBlob: splitBlob)
    }
    
    private func splitBlobIntoLines(stanzaBlob: String) -> [String] {
        let santitizedLineBreaks = stanzaBlob.replacingOccurrences(of: "\r", with: "\n")
        let split = santitizedLineBreaks.components(separatedBy: "\n")
        let noBlankLines = removeBlankLines(lines: split)
        return noBlankLines
    }
    
    private func scanForIndex(stanzaBlob: String) -> Int {
    let regex = try! NSRegularExpression(pattern: "^[0-9]+", options: .caseInsensitive)
    let match = regex.matches(in: stanzaBlob,
                              options: NSRegularExpression.MatchingOptions(rawValue: 0),
                              range: NSMakeRange(0, stanzaBlob.characters.count))
        
    let i = match.first
    let indexString = (stanzaBlob as NSString).substring(with: (i?.range)!)
        if let indexInt = Int(indexString) {
            return indexInt
        } else {
            return 0
        }
    }
    
    private func scanForTimes(stanzaBlob: String) -> (startTime: String, endTime: String) {
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
        return (times[0], times[1])
    }
    
    func scanForLines(splitBlob: [String]) -> [String] {
        var noBlankLines = removeBlankLines(lines: splitBlob)
        var lines = [String]()
        for index in 2..<noBlankLines.count {
            lines.append(noBlankLines[index])
        }
        return lines
    }
    
    func removeBlankLines(lines: [String]) -> [String] {
        var noBlankLines = [String]()
        for line in lines {
            if line != "" {
                noBlankLines.append(line)
            }
        }
        return noBlankLines
    }
}












