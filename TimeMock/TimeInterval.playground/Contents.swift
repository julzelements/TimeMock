//: Playground - noun: a place where people can play

import UIKit
import Foundation

let myDate = Date()
let mySeconds = myDate.timeIntervalSince1970

let myNSDate = NSDate()

let delta = 300.0

let fiveMinutesIntoTheFuture = Date(timeInterval: delta, since: myDate)
let fiveMinutesIntoTheFutureInSeconds = fiveMinutesIntoTheFuture.timeIntervalSince1970

print((mySeconds - fiveMinutesIntoTheFutureInSeconds))








