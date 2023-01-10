//
//  PlayerViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

final class PlayerViewModel {
    var trackModel: TrackModel
    var playerService: PlayerService
    
    init(trackModel: TrackModel, playerService: PlayerService) {
        self.trackModel = trackModel
        self.playerService = playerService
    }
}

extension PlayerViewModel: PlayerViewModelProtocol {}


