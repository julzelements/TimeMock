//
//  ViewController.swift
//  TimeMock
//
//  Created by Julian Scharf on 3/7/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var timer = Timer()
    var lastTime: Double!
    var accuracyResults: [Double]!

    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var time: UILabel!

    var globalTime: Date!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        globalTime = Date()
        print("Global start time: \(globalTime)")
        lastTime = 0
        accuracyResults = []
    }

    @IBAction func go(_ sender: Any) {
        for index in 1...100000000 {
            let offset = Double(index)
            makeATimer(offset: offset)
        }
    }
    
    func updateLabel() {
        let now = Date()
        time.text = now.description
        let seconds = now.timeIntervalSince1970
        let diff = (seconds - lastTime! - 1.0) * 1000
        accuracy.text = String(diff)
        accuracyResults.append(diff)
        lastTime = seconds
    }
    
    func makeATimer(offset: Double) {
        let fireDate = Date(timeInterval: offset, since: globalTime)
        timer = Timer(fireAt: fireDate, interval: 0, target: self, selector: (#selector(ViewController.updateLabel)), userInfo: nil, repeats: false)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
}

