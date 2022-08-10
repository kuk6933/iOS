//
//  WatchView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct WatchView: View {
    @ObservedObject  var stopWatchManager: StopWatchManager
    var timeUnit: Int
    var doubleTimeUnit: Double
    var timeUnitStr: String {
        let timeUnitStr = String(timeUnit)
        return timeUnit < 10 ? "0" + timeUnitStr : timeUnitStr
    }
    var doubleTimeUnitStr: String {
        let doubleTimeUnitStr = String(format: "%.2f", doubleTimeUnit)
        return doubleTimeUnit < 10 ? "0" + doubleTimeUnitStr : doubleTimeUnitStr
    }
    var combinedUnitStr: String {
        let combinedUintStr = timeUnitStr + ":" + doubleTimeUnitStr
        stopWatchManager.toBelapped = combinedUintStr
        return combinedUintStr
    }
    
    var body: some View {
        HStack{
            Text(combinedUnitStr)
            
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView(stopWatchManager: StopWatchManager(), timeUnit: 1, doubleTimeUnit: 0.1)
    }
}
