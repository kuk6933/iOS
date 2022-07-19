//
//  History.swift
//  Scrumdinger
//
//  Created by ohhyeongseok on 2022/07/19.
//

import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthIntMinutes: Int
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], lengthIntMinutes:Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthIntMinutes = lengthIntMinutes
        
    }
}
