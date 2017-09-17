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
    var events: SubtitleEvents!
    var globalTime: Date!
    var player: Player!
    
    @IBOutlet weak var subsLabel: UILabel!
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        globalTime = Date()
        print("Global start time: \(globalTime)")
        events = getEvents()
        makeATimer(offset: 0, eventIndex: 0)
//        playWithAVPlayer()
        
    }

    
    @objc func updateLabel() {
        let currentIndex = timer.userInfo as! Int
        let currentEvent = events[currentIndex]
        
        let sub = "\(currentEvent.text)\n\(currentEvent.time)"
        subsLabel.text = sub
        
        if currentIndex <= events.count - 1  {
            let nextIndex = currentIndex + 1
            let nextEvent = events[currentIndex + 1]
            makeATimer(offset: nextEvent.time, eventIndex: nextIndex)
        }
        print("time \(currentEvent.time)")
        print("index \(currentIndex)")

        
    }
    
    func makeATimer(offset: Double, eventIndex: Int) {
        let fireDate = Date(timeInterval: offset, since: globalTime)
        timer = Timer(fireAt: fireDate, interval: 0, target: self, selector: (#selector(ViewController.updateLabel)), userInfo: eventIndex, repeats: false)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    
    func getEvents() -> SubtitleEvents {
        let rawSubs = SubtitleIO.getRawStringFromFileInBundle(fileName: "test", fileExtension: "srt")
        return SubtitleEvents(rawSRTString: rawSubs)
    }
    
    func getRawURLFromFileInBundle(fileName: String, fileExtension: String) -> URL {
        let bundle = Bundle.main
        return bundle.url(forResource: fileName, withExtension: fileExtension)!
    }
    
    func playWithAVPlayer() {
        let videoURL = getRawURLFromFileInBundle(fileName: "spiderman", fileExtension: "mov")
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        
        let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        playerLayer.frame = frame
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }

}

