//
//  Track.swift
//  AppleMusic
//
//  Created by ohhyeongseok on 2023/01/01.
//

import Foundation
import UIKit

struct Track {
    var title: String
    var artist: String
    var albumName: String
    var artwork: UIImage
    
    init(title: String, artist: String, albumName: String, artwork: UIImage) {
        self.title = title
        self.artist = artist
        self.albumName = albumName
        self.artwork = artwork
    }
}

