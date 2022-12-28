//
//  ViewController.swift
//  UIKitHW
//
//  Created by Konstantin Gracheff on 19.12.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    enum Constants {
        static let appNameLabelFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
        
        static let songsStackViewSpacing: CGFloat = 10
        
        static let appNameLabelHeightAnchor: CGFloat = 20
    }
    
    //MARK: - UI
    private let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Plist"
        label.font = Constants.appNameLabelFont
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var firstSongView = TrackCellView(trackName: "Track 1",
                                                   duration: "2:30",
                                                   albumIcon: UIImage(systemName: "music.note.list"))
    
    private  lazy var secondSongView = TrackCellView(trackName: "Track 2",
                                                     duration: "1:34",
                                                     albumIcon: UIImage(systemName: "music.note.list"))
    
    private lazy var songsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstSongView,
                                                       secondSongView])
        stackView.axis = .vertical
        stackView.spacing = Constants.songsStackViewSpacing
        return stackView
    }()
    
    //MARK: - Lifecyclec funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupLayoutUI()
    }
    
    //MARK: - setDelegates
    private func setDelegates() {
        firstSongView.delegate = self
        secondSongView.delegate = self
    }
    
    //MARK: - setupLayoutUI
    private func setupLayoutUI() {
        
        view.backgroundColor = .secondarySystemBackground
        
        let subviews = [appNameLabel, songsStackView]
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        
        NSLayoutConstraint.activate([
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            appNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            appNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            appNameLabel.heightAnchor.constraint(equalToConstant: Constants.appNameLabelHeightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            songsStackView.topAnchor.constraint(equalTo: appNameLabel.bottomAnchor),
            songsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            songsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

//MARK: - TrackCellViewDelegate
extension HomeViewController: TrackCellViewDelegate {
    func openVCwith(name: String) {
        let vc = PlayerViewController(trackName: name)
        present(vc, animated: true)
    }
}
