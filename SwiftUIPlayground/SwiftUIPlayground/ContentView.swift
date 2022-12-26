//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by ohhyeongseok on 2022/12/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis = ["🌿", "🐲", "🌍", "🍄", "🌜"]
        VStack {
            ForEach(emojis, id: \.self) { emoji in
                Text(emoji)
                    .font(.largeTitle)
                    .padding(30)
                    .border(.pink)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
