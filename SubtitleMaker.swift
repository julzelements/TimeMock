//
//  SubtitleMaker.swift
//  TimeMock
//
//  Created by Julian Scharf on 10/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import UIKit

enum SubtitleMaker {
    static func makeSubs(rawSRTString: String) -> [Int: Stanza] {
        let sanitizedSRT = sanitizeLineBreaks(rawSRTString: rawSRTString)
        let stanzaBlobs = sanitizedSRT.components(separatedBy: "\n\n")
        var subtitles = [Int: Stanza]()
        for stanzaBlob in stanzaBlobs {
            let stanza = Stanza(stanzaBlob: stanzaBlob)
            if let index = stanza.index {
                subtitles[index] = stanza
            }
        }
        return subtitles
    }
    
    static func sanitizeLineBreaks(rawSRTString: String) -> String {
        return rawSRTString.replacingOccurrences(of: "\r", with: "\n")
    }
}
