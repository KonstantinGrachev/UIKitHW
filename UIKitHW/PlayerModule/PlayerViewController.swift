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
        static let leadingBasicSideIndentation: CGFloat = 20
        static let trailingBasicSideIndentation: CGFloat = -20
        static let topIndentation: CGFloat = 20
        static let heightWidthGrayButtons: CGFloat = 44
        static let heightWidthplayPausePlayerButton: CGFloat = 60
        static let heightWidthPreviousNextPlayerButtons: CGFloat = 44
        static let albumImageViewCornerRadius: CGFloat = 10
        static let albumImageViewBorderWidth: CGFloat = 1
    }
    
    //MARK: enums
    enum TrackSelectButtonType {
        case next, previous
    }
    
    enum PlayerStateType {
        case play, pause
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
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = Constants.albumImageViewBorderWidth
        imageView.layer.cornerRadius = Constants.albumImageViewCornerRadius
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
    
    private lazy var trackDurationSlider: UISlider = {
        let slider = UISlider()
        slider.addTarget(self, action: #selector(trackDurationSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    //MARK: Internal properties
    var viewModel: PlayerViewModelProtocol?
    
    //MARK: Private properties
    private lazy var playerService = viewModel?.playerService
    
    //MARK: Lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        playerService?.setPlayer()
        setTrackSlider()
        setupUI()
        setupButtonsAndSlider()
        setupLabelsAndImageViews()
        configureUIfromViewModel()
    }
    
    //MARK: Private funcs
    private func configureUIfromViewModel() {
        guard let trackInfo = viewModel?.trackModel else { return }
        topScreenAlbumHeaderLabel.text = trackInfo.albumName
        trackNameHeaderLabel.text = trackInfo.trackName
        trackArtistSubheaderLabel.text = trackInfo.artist
        albumImageView.image = UIImage(systemName: trackInfo.albumIcon)
    }
    
    private func setTrackSlider() {
        guard let duration = playerService?.getDuration() else { return }
        trackDurationSlider.minimumValue = 0
        trackDurationSlider.maximumValue = Float(duration)
        setDurationLabels()
    }
    
    private func setDurationLabels() {
        let startPosition = trackDurationSlider.value.convertSeconds()
        let endPosition = (trackDurationSlider.maximumValue - trackDurationSlider.value).convertSeconds()
        
        durationFromStartLabel.text = "\(startPosition.0.setZeroForSecond()):\(startPosition.1.setZeroForSecond())"
        durationToEndLabel.text = "-\(endPosition.0.setZeroForSecond()):\(endPosition.1.setZeroForSecond())"
    }
    
    //MARK: action funcs
    @objc private func trackDurationSliderValueChanged() {
        playerService?.setSelectTime(timeInterval: TimeInterval(trackDurationSlider.value))
    }
    
    @objc private func trackSliderValue() {
        guard let time = playerService?.getCurrentTime() else { return }
        trackDurationSlider.value = Float(time)
        setDurationLabels()
    }
    
    @objc private func dismissChevronButtonTapped() {
        dismiss(animated: true)
    }

    @objc private func shareActivityButtonTapped() {
       showActivityController()
    }

    @objc private func addToPlaylistButtonTapped() {
        showAlert()
    }

    @objc private func infoDescriptionButtonTapped() {
        print("infoDescriptionButtonTapped")
    }

    @objc private func shufflePlayerButtonTapped() {
        print("shufflePlayerButtonTapped")
    }

    @objc private func previousPlayerButtonTapped() {
        manageTrack(type: .previous)
    }

    @objc private func playPausePlayerButtonTapped() {
        guard let playerService = playerService else { return }
        if !playerService.isPlaying {
            playStopMusic(with: .play)
        } else {
            playStopMusic(with: .pause)
        }
    }

    @objc private func nextPlayerButtonTapped() {
        manageTrack(type: .next)
    }
    
    @objc private func repeatPlayerButtonTapped() {
        print("repeatPlayerButtonTapped")
    }
    
    //MARK: Private funcs
    private func showAlert() {
        let alert = UIAlertController(title: "Success",
                                      message: "Track successfully added to favorites",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        present(alert, animated: true)
    }
    private func showActivityController() {
        guard let item = viewModel?.trackModel.trackName else { return }
        let items = [item]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
    
    private func playStopMusic(with type: PlayerStateType) {
       
        lazy var trackTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(trackSliderValue), userInfo: nil, repeats: true)
        guard let playerService = playerService else { return }

        switch type {
        case .play:
            playPausePlayerButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            playerService.playTrack()
            trackTimer.fire()
            playerService.isPlaying = true
        case .pause:
            playPausePlayerButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            playerService.stopTrack()
            trackTimer.invalidate()
            playerService.isPlaying = false
        }
    }
    
    private func manageTrack(type: TrackSelectButtonType) {
        guard let tracklist = playerService?.getAllTracks() else { return }
        switch type {
        case .next:
            for (index, track) in tracklist.enumerated() {
                var nextIndex = index + 1
                
                if viewModel?.trackModel == track, nextIndex < tracklist.count {
                    setTrack(with: nextIndex, in: tracklist)
                    return
                } else {
                    nextIndex = 0
                    setTrack(with: nextIndex, in: tracklist)
                    return
                }
            }
        case .previous:
            for (index, track) in tracklist.enumerated() {
                let previousIndex = index
                
                if viewModel?.trackModel != track, previousIndex == 0 {
                    setTrack(with: previousIndex, in: tracklist)
                    return
                } else {
                    let previousIndex = tracklist.count - 1
                    setTrack(with: previousIndex, in: tracklist)
                    return
                }
            }
        }
    }
    
    private func setTrack(with index: Int, in tracklist: [TrackModel]) {
        viewModel?.trackModel = tracklist[index]
        playerService?.trackModel = tracklist[index]
        playerService?.setPlayer()
        configureUIfromViewModel()
        playStopMusic(with: .play)
    }
    
    private func setupUI() {
        
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
    }
    
    private func setupButtonsAndSlider() {
        
        NSLayoutConstraint.activate([
            dismissChevronButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            dismissChevronButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topIndentation),
            dismissChevronButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            dismissChevronButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            shareActivityButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation),
            shareActivityButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topIndentation),
            shareActivityButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            shareActivityButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            addToPlaylistButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            addToPlaylistButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: Constants.topIndentation),
            addToPlaylistButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            addToPlaylistButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            infoDescriptionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation),
            infoDescriptionButton.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: Constants.topIndentation),
            infoDescriptionButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            infoDescriptionButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
        
        NSLayoutConstraint.activate([
            trackDurationSlider.topAnchor.constraint(equalTo: trackArtistSubheaderLabel.bottomAnchor, constant: Constants.topIndentation),
            trackDurationSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            trackDurationSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation)
        ])
        
        NSLayoutConstraint.activate([
            playPausePlayerButton.topAnchor.constraint(equalTo: trackDurationSlider.bottomAnchor, constant: Constants.topIndentation),
            playPausePlayerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playPausePlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthplayPausePlayerButton),
            playPausePlayerButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthplayPausePlayerButton)
        ])
        
        NSLayoutConstraint.activate([
            shufflePlayerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
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
            repeatPlayerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation),
            repeatPlayerButton.centerYAnchor.constraint(equalTo: playPausePlayerButton.centerYAnchor),
            repeatPlayerButton.heightAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons),
            repeatPlayerButton.widthAnchor.constraint(equalToConstant: Constants.heightWidthGrayButtons)
        ])
    }
    
    private func setupLabelsAndImageViews() {
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
            albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation),
            albumImageView.topAnchor.constraint(equalTo: topScreenAlbumHeaderLabel.bottomAnchor, constant: Constants.topIndentation),
            albumImageView.heightAnchor.constraint(equalTo: albumImageView.widthAnchor)
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
            durationFromStartLabel.leadingAnchor.constraint(equalTo: trackDurationSlider.leadingAnchor),
            durationFromStartLabel.bottomAnchor.constraint(equalTo: trackDurationSlider.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            durationToEndLabel.trailingAnchor.constraint(equalTo: trackDurationSlider.trailingAnchor),
            durationToEndLabel.bottomAnchor.constraint(equalTo: trackDurationSlider.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            devicesAvailableLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            devicesAvailableLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            devicesAvailableLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation)
        ])
        
        NSLayoutConstraint.activate([
            devicesAvailableImageView.bottomAnchor.constraint(equalTo: devicesAvailableLabel.topAnchor),
            devicesAvailableImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingBasicSideIndentation),
            devicesAvailableImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: Constants.trailingBasicSideIndentation)
        ])
    }
}
