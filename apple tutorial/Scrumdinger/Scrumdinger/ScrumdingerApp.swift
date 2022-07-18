//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by ohhyeongseok on 2022/07/11.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
