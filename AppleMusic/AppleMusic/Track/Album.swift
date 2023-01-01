//
//  Album.swift
//  AppleMusic
//
//  Created by ohhyeongseok on 2023/01/01.
//

import Foundation
import UIKit

struct Album {
    let title: String
    let tracks: [Track]
    
    var thumbnail: UIImage? {
        return tracks.first?.artwork
    }
    
    var artist: String? {
        return tracks.first?.artist
    }
    
    init(title: String, tracks: [Track]) {
        self.title = title
        self.tracks = tracks
    }
}
