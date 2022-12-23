//
//  PlayerCellView.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

class PlayerCellView: UIView {
    
    private let albumIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var tapScreen = UITapGestureRecognizer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    convenience init(trackName: String, duration: String, albumIcon: UIImage?, target: Any?, tapAction: Selector) {
        self.init()
        self.trackNameLabel.text = trackName
        self.durationLabel.text = duration
        self.albumIconImageView.image = albumIcon
        self.tapScreen = .init(target: target, action: tapAction)
        self.addGestureRecognizer(tapScreen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlayerCellView {
    private func setupView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        addSubview(albumIconImageView)
        addSubview(trackNameLabel)
        addSubview(durationLabel)
        addSubview(divisionView)
    }
    
    enum Constants {
        enum Constraints {
            static let albumIconImageViewSize: CGFloat = 60
            static let albumIconImageViewTopBottomAnchor: CGFloat = 5
            static let sideIndentationAnchor: CGFloat = 10
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            albumIconImageView.heightAnchor.constraint(equalToConstant: Constants.Constraints.albumIconImageViewSize),
            albumIconImageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.albumIconImageViewSize),
            albumIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideIndentationAnchor),
            albumIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Constraints.albumIconImageViewTopBottomAnchor),
            albumIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: -Constants.Constraints.albumIconImageViewTopBottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trackNameLabel.centerYAnchor.constraint(equalTo: albumIconImageView.centerYAnchor),
            trackNameLabel.leadingAnchor.constraint(equalTo: albumIconImageView.trailingAnchor, constant: Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.centerYAnchor.constraint(equalTo: albumIconImageView.centerYAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: albumIconImageView.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: durationLabel.trailingAnchor),
            divisionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            divisionView.heightAnchor.constraint(equalToConstant: 1)

        ])
    }
}
