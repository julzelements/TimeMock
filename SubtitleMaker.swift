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
    
    static func getEvents(subs: [Int: Stanza]) -> [SubtitleEvent] {
        var events = [SubtitleEvent]()
        for sub in subs {
            let lines = sub.value.lines.joined(separator: "\n")
            let startEvent = SubtitleEvent(time: sub.value.startTime, text: lines)
            events.append(startEvent)
            let endEvent = SubtitleEvent(time: sub.value.endTime, text: "")
            events.append(endEvent)
        }
        return events
    }
    
}
