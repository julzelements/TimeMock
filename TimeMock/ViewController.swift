//
//  ViewController.swift
//  TimeMock
//
//  Created by Julian Scharf on 3/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import UIKit
import Foundation
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var accuracyResults: [Double]!
    var events: [SubtitleEvent]!
    var globalTime: Date!
    
    @IBOutlet weak var subsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalTime = Date()
        print("Global start time: \(globalTime)")
        events = getEvents()
        makeATimer(offset: 1.0, eventIndex: 0)
    }

    
    func updateLabel() {
        let currentIndex = timer.userInfo as! Int
        let currentEvent = events[currentIndex]
        
        let sub = "\(currentEvent.text)\n\(currentEvent.time)"
        subsLabel.text = sub
        
        if currentIndex <= events.count - 1  {
            let nextIndex = currentIndex + 1
            let nextEvent = events[currentIndex + 1]
            makeATimer(offset: nextEvent.time, eventIndex: nextIndex)
        }

        
    }
    
    func makeATimer(offset: Double, eventIndex: Int) {
        let fireDate = Date(timeInterval: offset, since: globalTime)
        timer = Timer(fireAt: fireDate, interval: 0, target: self, selector: (#selector(ViewController.updateLabel)), userInfo: eventIndex, repeats: false)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    func getEvents() -> [SubtitleEvent] {
        let rawSubs = SubtitleIO.getRawStringFromFileInBundle(fileName: "spiderman", fileExtension: "srt")
        return EventMaker.getEvents(rawSRTString: rawSubs)
    }

}

