//
//  MockData.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

final class MockMusicData {
    
    let tracks = [
        TrackModel(trackName: "Wiggle",
                   albumName: "Snoopy Rap",
                   albumIcon: "music.note.list",
                   artist: "Snoop Dog",
                   duration: 100,
                   type: .mp3),
        TrackModel(trackName: "Дикий мужчина",
                   albumName: "Лучшее Ленинград",
                   albumIcon: "music.mic",
                   artist: "Шнур",
                   duration: 132,
                   type: .mp3)
    ]
}
