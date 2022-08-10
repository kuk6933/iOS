//
//  TimerButton.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject  var stopWatchManager: StopWatchManager
    var body: some View {
        HStack{
            if !stopWatchManager.isWorking {
                
                Button {
                    stopWatchManager.reset()
                } label: {
                    Text("Reset")
                }
                .padding()
                .foregroundColor(.black)
                Button {
                    stopWatchManager.start()
                } label: {
                    Text("Start")
                }
                .padding()
                .foregroundColor(.green)
            }
            else {
                
                Button {
                    stopWatchManager.storeLap(record: stopWatchManager.toBelapped)
                } label: {
                    Text("Lap")
                }
                .padding()
                .foregroundColor(.black)
                Button {
                    stopWatchManager.stop()
                } label: {
                    Text("Stop")
                }
                .padding()
                .foregroundColor(.red)
                
                
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(stopWatchManager: StopWatchManager())
    }
}
