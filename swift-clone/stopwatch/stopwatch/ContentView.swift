//
//  ContentView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject  var stopWatchManager: StopWatchManager
    var body: some View {
        VStack
        {
            WatchView()
            Spacer()
            ButtonView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
