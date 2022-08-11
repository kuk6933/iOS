//
//  WatchView.swift
//  stopwatch
//
//  Created by ohhyeongseok on 2022/07/25.
//

import SwiftUI

struct WatchView: View {
    var combinedUnitStr: String
    
    var body: some View {
        HStack{
            Text(combinedUnitStr)
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView(combinedUnitStr: "aa")
    }
}
