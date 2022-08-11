//
//  StopWatchComponent.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/08/10.
//

import Foundation

struct StopWatchComponent {
    var isWorking = false
    var timer = Timer()
    var secondsElapsed = 0.00
    var minutesElapsed = 0
    var toBelapped = ""
    var lapArray : [String] = []
    
    var timeUnitStr: String {
        let timeUnitStr = String(minutesElapsed)
        return minutesElapsed < 10 ? "0" + timeUnitStr : timeUnitStr
    }
    var doubleTimeUnitStr: String {
        let doubleTimeUnitStr = String(format: "%.2f", secondsElapsed)
        return secondsElapsed < 10 ? "0" + doubleTimeUnitStr : doubleTimeUnitStr
    }
    var combinedUnitStr: String {
        let combinedUintStr = timeUnitStr + ":" + doubleTimeUnitStr
        return combinedUintStr
    }
    
    mutating func stop() {
        timer.invalidate()
        isWorking = false
    }
    
    mutating func reset() {
        secondsElapsed = 0.00
        minutesElapsed = 0
        lapArray.removeAll()
    }
    
    mutating func storeLap(record: String) {
        lapArray.append(record)
    }
}
