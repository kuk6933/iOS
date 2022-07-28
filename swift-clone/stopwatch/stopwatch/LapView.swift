//
//  LapView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/28.
//

import SwiftUI

struct LapView: View {
    @ObservedObject  var stopWatchManager: StopWatchManager
    var body: some View {
        ScrollView {
            VStack{
                ForEach(stopWatchManager.lapArray, id: \.self ,content: {
                    Text("\(String(format: "%.2f" ,$0))")
                        .padding()
                })
            }
        }
    }
}

struct LapView_Previews: PreviewProvider {
    static var previews: some View {
        LapView(stopWatchManager: StopWatchManager())
    }
}
