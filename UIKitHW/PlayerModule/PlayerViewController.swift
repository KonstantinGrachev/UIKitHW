//
//  PlayerViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

final class PlayerViewController: UIViewController {
    
    //MARK: Constants
    enum Constants {
        
    }

    //MARK: UI
    private let topScreenAlbumFromSubheaderLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .topScreenAlbumFromSubheaderLabel)
        return label
    }()
    
    private let topScreenAlbumHeaderLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .topScreenAlbumHeaderLabel)
        return label
    }()
    
    private lazy var dismissChevronButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .dismissChevron, with: self, #selector(dismissChevronButtonTapped))
        return button
    }()
    
    private lazy var shareActivityButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .shareActivity, with: self, #selector(shareActivityButtonTapped))
        return button
    }()
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var addToPlaylistButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .addToPlaylist, with: self, #selector(addToPlaylistButtonTapped))
        return button
    }()
    
    private lazy var infoDescriptionButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .infoDescription, with: self, #selector(infoDescriptionButtonTapped))
        return button
    }()
    
    private let trackNameHeaderLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .trackNameHeaderLabel)
        return label
    }()
    
    private let trackArtistSubheaderLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .trackArtistSubheaderLabel)
        return label
    }()
    
    private let durationFromStartLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .durationFromStartLabel)
        return label
    }()
    
    private let durationToEndLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .durationToEndLabel)
        return label
    }()
    
    private lazy var shufflePlayerButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .shufflePlayer, with: self, #selector(shufflePlayerButtonTapped))
        return button
    }()
    
    private lazy var previousPlayerButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .previousPlayer, with: self, #selector(previousPlayerButtonTapped))
        return button
    }()
    
    private lazy var playPausePlayerButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .playPausePlayer, with: self, #selector(playPausePlayerButtonTapped))
        return button
    }()
    
    private lazy var nextPlayerButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .nextPlayer, with: self, #selector(nextPlayerButtonTapped))
        return button
    }()
    
    private lazy var repeatPlayerButton: CustomPlayerScreenButton = {
        let button = CustomPlayerScreenButton(type: .system)
        button.configure(type: .repeatPlayer, with: self, #selector(repeatPlayerButtonTapped))
        return button
    }()
    
    private let devicesAvailableImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let devicesAvailableLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .devicesAvailableLabel)
        return label
    }()
    
    private let trackDurationSlider: UISlider = {
        let slider = UISlider()
        return slider
    }()
    
    //MARK: Initialization
    init(trackName: String) {
        self.trackName = trackName
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Internal properties
    var trackName: String
    
    //MARK: Lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayoutUI()
    }
    
    //MARK: action funcs
    
    @objc private func dismissChevronButtonTapped() {
        print("dismissChevronButton")
    }

    @objc private func shareActivityButtonTapped() {
        print("shareActivityButtonTapped")
    }

    @objc private func addToPlaylistButtonTapped() {
        print("addToPlaylistButtonTapped")
    }

    @objc private func infoDescriptionButtonTapped() {
        print("infoDescriptionButtonTapped")
    }

    @objc private func shufflePlayerButtonTapped() {
        print("shufflePlayerButtonTapped")
    }

    @objc private func previousPlayerButtonTapped() {
        print("previousPlayerButtonTapped")
    }

    @objc private func playPausePlayerButtonTapped() {
        print("playPausePlayerButtonTapped")
    }

    @objc private func nextPlayerButtonTapped() {
        print("nextPlayerButtonTapped")
    }
    
    @objc private func repeatPlayerButtonTapped() {
        print("repeatPlayerButtonTapped")
    }
    
    //MARK: - setupLayoutUI
    private func setupLayoutUI() {
        
        view.backgroundColor = .secondarySystemBackground
        
        let subviews = [topScreenAlbumFromSubheaderLabel,
                        topScreenAlbumHeaderLabel,
                        dismissChevronButton,
                        shareActivityButton,
                        albumImageView,
                        addToPlaylistButton,
                        infoDescriptionButton,
                        trackNameHeaderLabel,
                        trackArtistSubheaderLabel,
                        durationFromStartLabel,
                        durationToEndLabel,
                        shufflePlayerButton,
                        previousPlayerButton,
                        playPausePlayerButton,
                        nextPlayerButton,
                        repeatPlayerButton,
                        devicesAvailableImageView,
                        devicesAvailableLabel,
                        trackDurationSlider]
        
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
        
        ])
    }
}
