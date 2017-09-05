//
//  Player.swift
//  TimeMock
//
//  Created by Julian Scharf on 5/9/17.
//  Copyright © 2017 Julian Scharf. All rights reserved.
//

import UIKit

class Player {
    
    var apiSystemTime: Double!
    var apiMovieTime: Double!
    var events: [SubtitleEvent]!
    var time: ITime!
    
    var currentMovieTime: Double!
    var currentSubtitleIndex: Int!
    var timeIntervalToNextSubtitle: Double!
    
    init(apiSystemTime: Double, apiMovieTime: Double, arrayOfEvents: [SubtitleEvent], time: ITime) {
        self.apiSystemTime = apiSystemTime
        self.apiMovieTime = apiMovieTime
        self.events = arrayOfEvents
        self.time = time
        preparePlayer(time: self.time)
    }
    
    private func getCurrentMovieTime() -> Double {
        return time.timeIntervalSinceReferenceDate - apiSystemTime + apiMovieTime
    }
    
    private func getCurrentSubtitleIndex() -> Int {
        for index in 0..<events.count {
            if events[index].time > currentMovieTime {
            return index - 1
            }
        }
        return 0
    }
    
    private func getTimeIntervalToNextSubtitle() -> Double {
        let nextSubtitle = events[currentSubtitleIndex + 1]
        let nextSubtitleMovieTime = nextSubtitle.time
        return nextSubtitleMovieTime - currentMovieTime
    }
    
    func preparePlayer(time: ITime) {
        currentMovieTime = getCurrentMovieTime()
        currentSubtitleIndex = getCurrentSubtitleIndex()
        timeIntervalToNextSubtitle = getTimeIntervalToNextSubtitle()
    }
    
}