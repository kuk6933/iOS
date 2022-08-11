//
//  stopwatchApp.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

@main
struct stopwatchApp: App {
    private var stopWatchManager = StopWatchManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(stopWatchManager)
        }
    }
}
