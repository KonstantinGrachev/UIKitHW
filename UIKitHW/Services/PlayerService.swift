//
//  PlayerService.swift
//  UIKitHW
//
//  Created by Константин Грачев on 29.12.2022.
//

import Foundation
import AVFoundation

class PlayerService {
    
    var player: AVAudioPlayer?
    var trackName: String?
    
    func setPlayer() {
        guard let url = Bundle.main.url(forResource: trackName, withExtension: "mp3") else { return }
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
    
    func setTrackName(trackName: String) {
        self.trackName = trackName
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
}

