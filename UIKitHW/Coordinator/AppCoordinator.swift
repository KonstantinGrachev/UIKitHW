//
//  AppCoordinator.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var playerService: PlayerService
    
    init(navigationController: UINavigationController, playerService: PlayerService) {
        self.navigationController = navigationController
        self.playerService = playerService
    }
    
    func start() {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel(playerService: playerService, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showPlayerScreen(with trackModel: TrackModel, from viewController: UIViewController) {
        let vc = PlayerViewController()
        vc.viewModel = PlayerViewModel(trackModel: trackModel, playerService: playerService)
        playerService.trackModel = trackModel
        viewController.present(vc, animated: true)
    }
}
