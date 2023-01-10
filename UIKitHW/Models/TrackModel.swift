//
//  TrackModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

struct TrackModel {
    var trackName: String
    let albumName: String
    let albumIcon: String
    let artist: String
    let duration: Float
    let type: TrackType
}

enum TrackType: String {
    case mp3
    case wav
}
