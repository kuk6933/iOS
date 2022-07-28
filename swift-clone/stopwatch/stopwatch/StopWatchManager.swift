//
//  StopWatchManager.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI
class StopWatchManager: ObservableObject {
    
    @Published var isWorking = false 
    @Published var secondsElapsed = 0.00
    @Published var toBelapped = ""
    var minutesElapsed = 0
    @Published var lapArray : [String] = []
    var timer = Timer()
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            self.secondsElapsed += 0.01
            if(self.secondsElapsed >= 60.0)
            {
                self.secondsElapsed = self.secondsElapsed - 60.0
                self.minutesElapsed += 1
            }
        }
        isWorking = true
    }
    func stop()
    {
        timer.invalidate()
        isWorking = false
    }
    
    func reset()
    {
        secondsElapsed = 0.00
        minutesElapsed = 0 
        lapArray.removeAll()
    }
    
    func storeLap(record: String)
    {
        lapArray.append(record)
    }
}
