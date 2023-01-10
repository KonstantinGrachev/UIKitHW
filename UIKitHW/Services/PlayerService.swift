//
//  PlayerService.swift
//  UIKitHW
//
//  Created by Константин Грачев on 29.12.2022.
//

import Foundation
import AVFoundation

final class PlayerService {
    
    var player: AVAudioPlayer?
    var trackModel: TrackModel?
    
    var isPlaying: Bool = false
    
    func setPlayer() {
        guard let url = Bundle.main.url(forResource: trackModel?.trackName, withExtension: trackModel?.type.rawValue) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playTrack() {
        player?.play()
    }
    
    func stopTrack() {
        player?.stop()
    }
    
    func getDuration() -> TimeInterval? {
        player?.duration
    }
    
    func getCurrentTime() -> TimeInterval? {
        player?.currentTime
    }
    
    func setSelectTime(timeInterval: TimeInterval) {
        player?.currentTime = timeInterval
    }
    
    func getAllTracks() -> [TrackModel] {
        let data = MockMusicData()
        return data.tracks
    }
}

