//
//  WatchView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct WatchView: View {
    @EnvironmentObject  var stopWatchManager: StopWatchManager
    var body: some View {
        ScrollView{
            VStack{
                Text("Stop Watch")
                Section{
                    Text(String(format: "%.2f", stopWatchManager.secondsElapsed))
                        .font(.title)
                        .padding()
                }
            }
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}
