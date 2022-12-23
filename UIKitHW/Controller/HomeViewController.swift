//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Plist"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstSongView = PlayerCellView(trackName: "Track 1",
                                                    duration: "2:30",
                                                    albumIcon: UIImage(systemName: "music.note.list"),
                                               target: self,
                                               tapAction: #selector(openTrack))
    
    private  lazy var secondSongView = PlayerCellView(trackName: "Track 2",
                                                    duration: "2:10",
                                                albumIcon: UIImage(systemName: "music.note.list"),
                                                target: self,
                                                tapAction: #selector(openTrack))
    
    private lazy var songsStackView = UIStackView(arrangedSubviews: [firstSongView,
                                                                     secondSongView], spacing: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    //MARK: @objc funcs
    
    @objc private func openTrack() {
        print("Open this track")
    }
}

//MARK: - setupView
extension HomeViewController {
    private func setupView() {
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(appNameLabel)
        view.addSubview(songsStackView)
    }
}

//MARK: - setConstraints
extension HomeViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            songsStackView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor),
            songsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            songsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            songsStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
