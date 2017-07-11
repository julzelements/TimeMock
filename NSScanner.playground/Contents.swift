//: Playground - noun: a place where people can play

import UIKit

let stanzaBlob = "28\n00:01:46,120 --> 00:01:49,320\n- But you are a kid, you are 18\n- This is my chance to prove myself."

var regex = try NSRegularExpression(pattern: "^[0-9]+", options: .caseInsensitive)
var match = regex.matches(in: stanzaBlob, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, stanzaBlob.characters.count))
let i = match.first

let index = (stanzaBlob as NSString).substring(with: (i?.range)!)

print(index)
