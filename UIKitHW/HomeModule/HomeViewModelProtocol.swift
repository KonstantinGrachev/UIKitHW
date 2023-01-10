//
//  HomeViewModelProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var coordinator: AppCoordinator { get set }
    var playerService: PlayerService { get set }
    
    var title: String { get }
    
    var trackInfo: [TrackModel]? { get set }
}
