//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by ohhyeongseok on 2022/07/11.
//
import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}

