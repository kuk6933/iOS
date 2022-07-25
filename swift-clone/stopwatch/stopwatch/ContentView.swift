//
//  ContentView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject  var stopWatchManager = StopWatchManager()
    var body: some View {
        ScrollView{
            VStack{
                Text("Stop Watch")
                Section{
                    Text(String(format: "%.2f", stopWatchManager.secondsElapsed))
                        .font(.title)
                        .padding()
                    Button(action: { stopWatchManager.start()}) {
                        TimerButton(label:"Start", buttonColor: .blue)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
