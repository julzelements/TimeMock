//: Playground - noun: a place where people can play

import UIKit

let stanzaBlob = "28\n00:01:46,120 --> 00:01:49,320\n- But you are a kid, you're 18\n- This is my chance to prove myself."

//let pattern = "^[0-9]+"
let timeStampPattern = "\\d\\d:\\d\\d:\\d\\d,\\d\\d\\d"

var timeStampRegex = try! NSRegularExpression(pattern: timeStampPattern, options: .caseInsensitive)

var range = NSMakeRange(0, timeStampPattern.utf16.count)

var matches = timeStampRegex.matches(in: stanzaBlob,
                                     range: NSMakeRange(0, stanzaBlob.utf16.count))

let times = matches.map { result -> String in
    let timesRange = result.rangeAt(0)
    
    let start = String.UTF16Index(timesRange.location)
    let end = String.UTF16Index(timesRange.location + timesRange.length)
    let time = String(stanzaBlob.utf16[start..<end])!
    
    return time
}


print(times)