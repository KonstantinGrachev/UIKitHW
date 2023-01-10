//
//  HomeViewModel.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

final class HomeViewModel {
    var playerService: PlayerService
    var coordinator: AppCoordinator
    var trackInfo: [TrackModel]?
    var title = "Player"
    
    init(playerService: PlayerService, coordinator: AppCoordinator) {
        self.playerService = playerService
        self.coordinator = coordinator
        trackInfo = playerService.getAllTracks()
    }
}

extension HomeViewModel: HomeViewModelProtocol {}
