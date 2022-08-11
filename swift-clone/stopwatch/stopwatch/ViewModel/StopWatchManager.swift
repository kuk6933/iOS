//
//  StopWatchManager.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

class StopWatchManager: ObservableObject {
    @Published private var stopWatchComponent = StopWatchComponent()
    var combinedUnitStr: String {
        stopWatchComponent.combinedUnitStr
    }
    var isWorking: Bool {
        stopWatchComponent.isWorking
    }
    var lapArray: [String] {
        stopWatchComponent.lapArray
    }
    
    func start() {
        stopWatchComponent.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.stopWatchComponent.secondsElapsed += 0.01
            if(self.stopWatchComponent.secondsElapsed >= 60.0)
            {
                self.stopWatchComponent.secondsElapsed = self.stopWatchComponent.secondsElapsed - 60.0
                self.stopWatchComponent.minutesElapsed += 1
            }
        }
        stopWatchComponent.isWorking = true
    }
    
    func stop() {
        stopWatchComponent.stop()
    }
    
    func reset() {
        stopWatchComponent.reset()
    }
    
    func storeLap(record: String) {
        stopWatchComponent.storeLap(record: record)
    }
}
