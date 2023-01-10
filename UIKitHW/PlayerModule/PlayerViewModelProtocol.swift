//
//  PlayerViewModelProtocol.swift
//  UIKitHW
//
//  Created by Константин Грачев on 10.01.2023.
//

import Foundation

protocol PlayerViewModelProtocol {
    var trackModel: TrackModel { get }
    var playerService: PlayerService { get }
}
