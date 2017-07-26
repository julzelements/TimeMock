//: Playground - noun: a place where people can play

import UIKit
import Foundation


func makeStanza(i: Int) -> String {
    let start = 2 * i - 1
    let end = start + 1
    
    let startString = String(format: "%02d", start)
    let endString = String(format: "%02d", end)
    
    let line1 = String(i) + "\n"
    let line2 = "00:00:\(startString),000 --> 00:00:\(endString),000\n"
    let line3 = "On at: \(startString), off at: \(endString)\n"
    
    
    
    
    return (line1 + line2 + line3)
}

for i in 1...20 {
print(makeStanza(i: i))
}