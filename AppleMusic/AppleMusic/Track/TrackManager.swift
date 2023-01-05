//
//  TrackManager.swift
//  AppleMusicStApp
//
//  Created by ohhyeongseok on 2023/01/02.
//

import UIKit
import AVFoundation

class TrackManager {
    var tracks: [AVPlayerItem] = []
    var albums: [Album] = []
    var todaysTrack: AVPlayerItem?
    
    init() {
        let tracks = loadTracks()
        self.tracks = tracks
        self.albums = loadAlbums(tracks: tracks)
        self.todaysTrack = self.tracks.randomElement()
    }

    func loadTracks() -> [AVPlayerItem] {
        //파일들 읽어서 AVPlayerItem만들기
        let urls = Bundle.main.urls(forResourcesWithExtension: "mp3", subdirectory: nil) ?? []
        let items = urls.map { url in
            return AVPlayerItem(url: url)
        }
        return items
    }
    
    func track(at index: Int) -> Track? {
        let playerItem = tracks[index]
        return playerItem.convertToTrack()
    }

    func loadAlbums(tracks: [AVPlayerItem]) -> [Album] {
        let trackList: [Track] = tracks.compactMap { $0.convertToTrack() }
        let albumDics = Dictionary(grouping: trackList, by: { (track) in track.albumName })
        var albums: [Album] = []
        for (key, value) in albumDics {
            let title = key
            let tracks = value
            let album = Album(title: title, tracks: tracks)
            albums.append(album)
        }
        return albums
    }

    func loadOtherTodaysTrack() {
        self.todaysTrack = self.tracks.randomElement()
    }
    
}
