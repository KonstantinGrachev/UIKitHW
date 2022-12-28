//
//  PlayerViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

final class PlayerViewController: UIViewController {

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
        let imageView = UIImageView(image: UIImage(systemName: "music.note.list"))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.white.cgColor
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
        label.text = "00:00"
        return label
    }()
    
    private let durationToEndLabel: CustomPlayerScreenLabel = {
        let label = CustomPlayerScreenLabel()
        label.configure(type: .durationToEndLabel)
        label.text = "-03:59"
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
        let imageView = UIImageView(image: UIImage(systemName: "music.note.tv"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
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
        configure()
    }
    
    //MARK: Private funcs
    private func configure() {
        topScreenAlbumHeaderLabel.text = trackName
        trackNameHeaderLabel.text = trackName
        trackArtistSubheaderLabel.text = "Unknown artist"
    }
    
    //MARK: action funcs
    
    @objc private func dismissChevronButtonTapped() {
        dismiss(animated: true)
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
    
    //MARK: setupLayoutUI
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
            dismissChevronButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            dismissChevronButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topIndentation),
            dismissChevronButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            dismissChevronButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            shareActivityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation),
            shareActivityButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topIndentation),
            shareActivityButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            shareActivityButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            topScreenAlbumFromSubheaderLabel.topAnchor.constraint(equalTo: dismissChevronButton.topAnchor),
            topScreenAlbumFromSubheaderLabel.leadingAnchor.constraint(equalTo: dismissChevronButton.trailingAnchor),
            topScreenAlbumFromSubheaderLabel.trailingAnchor.constraint(equalTo: shareActivityButton.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            topScreenAlbumHeaderLabel.bottomAnchor.constraint(equalTo: dismissChevronButton.bottomAnchor),
            topScreenAlbumHeaderLabel.leadingAnchor.constraint(equalTo: dismissChevronButton.trailingAnchor),
            topScreenAlbumHeaderLabel.trailingAnchor.constraint(equalTo: shareActivityButton.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation),
            albumImageView.topAnchor.constraint(equalTo: topScreenAlbumHeaderLabel.bottomAnchor, constant: Constants.topIndentation),
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addToPlaylistButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            addToPlaylistButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: Constants.topIndentation),
            addToPlaylistButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            addToPlaylistButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            infoDescriptionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation),
            infoDescriptionButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: Constants.topIndentation),
            infoDescriptionButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            infoDescriptionButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            trackNameHeaderLabel.centerYAnchor.constraint(equalTo: addToPlaylistButton.centerYAnchor),
            trackNameHeaderLabel.leadingAnchor.constraint(equalTo: addToPlaylistButton.trailingAnchor),
            trackNameHeaderLabel.trailingAnchor.constraint(equalTo: infoDescriptionButton.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trackArtistSubheaderLabel.topAnchor.constraint(equalTo: trackNameHeaderLabel.bottomAnchor),
            trackArtistSubheaderLabel.leadingAnchor.constraint(equalTo: addToPlaylistButton.trailingAnchor),
            trackArtistSubheaderLabel.trailingAnchor.constraint(equalTo: infoDescriptionButton.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trackDurationSlider.topAnchor.constraint(equalTo: trackArtistSubheaderLabel.bottomAnchor, constant: Constants.topIndentation),
            trackDurationSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            trackDurationSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation)
        ])
        
        NSLayoutConstraint.activate([
            durationFromStartLabel.leadingAnchor.constraint(equalTo: trackDurationSlider.leadingAnchor),
            durationFromStartLabel.bottomAnchor.constraint(equalTo: trackDurationSlider.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            durationToEndLabel.trailingAnchor.constraint(equalTo: trackDurationSlider.trailingAnchor),
            durationToEndLabel.bottomAnchor.constraint(equalTo: trackDurationSlider.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            playPausePlayerButton.topAnchor.constraint(equalTo: trackDurationSlider.bottomAnchor, constant: Constants.topIndentation),
            playPausePlayerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPausePlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthplayPausePlayerButton),
            playPausePlayerButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthplayPausePlayerButton)
        ])
        
        NSLayoutConstraint.activate([
            shufflePlayerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            shufflePlayerButton.centerYAnchor.constraint(equalTo: playPausePlayerButton.centerYAnchor),
            shufflePlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            shufflePlayerButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            previousPlayerButton.leadingAnchor.constraint(equalTo: shufflePlayerButton.trailingAnchor),
            previousPlayerButton.trailingAnchor.constraint(equalTo: playPausePlayerButton.leadingAnchor),
            previousPlayerButton.centerYAnchor.constraint(equalTo: playPausePlayerButton.centerYAnchor),
            previousPlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthPreviousNextPlayerButtons)
        ])
                
        NSLayoutConstraint.activate([
            nextPlayerButton.trailingAnchor.constraint(equalTo: repeatPlayerButton.leadingAnchor),
            nextPlayerButton.leadingAnchor.constraint(equalTo: playPausePlayerButton.trailingAnchor),
            nextPlayerButton.centerYAnchor.constraint(equalTo: playPausePlayerButton.centerYAnchor),
            nextPlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthPreviousNextPlayerButtons)
        ])
        
        NSLayoutConstraint.activate([
            repeatPlayerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation),
            repeatPlayerButton.centerYAnchor.constraint(equalTo: playPausePlayerButton.centerYAnchor),
            repeatPlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            repeatPlayerButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            devicesAvailableLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            devicesAvailableLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            devicesAvailableLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation)
        ])
        
        NSLayoutConstraint.activate([
            devicesAvailableImageView.bottomAnchor.constraint(equalTo: devicesAvailableLabel.topAnchor),
            devicesAvailableImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.sideIndentation),
            devicesAvailableImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.sideIndentation)
        ])
        
        //MARK: Constants
        enum Constants {
            static let sideIndentation: CGFloat = 20
            static let topIndentation: CGFloat = 20
            static let heightWidthGrayButtons: CGFloat = 44
            static let heightWidthplayPausePlayerButton: CGFloat = 60
            static let heightWidthPreviousNextPlayerButtons: CGFloat = 44
        }
    }
}
