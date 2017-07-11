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
    
    init(stanzaBlob: String) {
        index = scanForIndex(stanzaBlob: stanzaBlob)
    }
    
    func scanForIndex(stanzaBlob: String) -> Int {
        var regex: NSRegularExpression
        do {
            regex = try NSRegularExpression(pattern: "^[0-9]+", options: .caseInsensitive)
            
        } catch {
            return 0
        }
    
    let match = regex.matches(in: stanzaBlob, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, stanzaBlob.characters.count))
    let i = match.first
    
    let indexString = (stanzaBlob as NSString).substring(with: (i?.range)!)
        if let indexInt = Int(indexString) {
            return indexInt
        } else {
            return 0
        }
    }
}
