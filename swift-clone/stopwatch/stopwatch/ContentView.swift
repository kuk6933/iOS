//
//  ContentView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var stopWatchManager = StopWatchManager()
    var body: some View {
        ScrollView{
            VStack
            {
                Text("Stop Watch")
                
                HStack{
                    WatchView(stopWatchManager: stopWatchManager, timeUnit: stopWatchManager.minutesElapsed, doubleTimeUnit: stopWatchManager.secondsElapsed)
                        .padding()
                }
                Section{
                    ButtonView(stopWatchManager: stopWatchManager)
                        .padding()
                }
                .padding()
                LapView(stopWatchManager: stopWatchManager)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
