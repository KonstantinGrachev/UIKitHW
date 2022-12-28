//
//  PlayerCellView.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

protocol TrackCellViewDelegate: AnyObject {
    func openVCwith(name: String)
}

class TrackCellView: UIView {
    
    //MARK: Constants
    enum Constants {
        static let albumIconImageViewSize: CGFloat = 60
        static let albumIconImageViewTopBottomAnchor: CGFloat = 5
        static let sideIndentationAnchor: CGFloat = 10
        
        static let trackNameLabelFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
        static let durationLabelFont: UIFont = .systemFont(ofSize: 16, weight: .light)
    }
    
    //MARK: TrackCellViewDelegate
    weak var delegate: TrackCellViewDelegate?
    
    //MARK: UI
    private let albumIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.trackNameLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.durationLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Internal properties
    private lazy var tapScreen = UITapGestureRecognizer()
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    //FIXME: fix to cunfigurator
    convenience init(trackName: String, duration: String, albumIcon: UIImage?) {
        self.init()
        self.trackNameLabel.text = trackName
        self.durationLabel.text = duration
        self.albumIconImageView.image = albumIcon
        self.tapScreen.delegate = self
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Private func
    private func setupUI() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        let subviews = [albumIconImageView, trackNameLabel, durationLabel, divisionView]
        subviews.forEach { subview in
            addSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        self.addGestureRecognizer(tapScreen)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            albumIconImageView.heightAnchor.constraint(equalToConstant: Constants.albumIconImageViewSize),
            albumIconImageView.widthAnchor.constraint(equalToConstant: Constants.albumIconImageViewSize),
            albumIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sideIndentationAnchor),
            albumIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.albumIconImageViewTopBottomAnchor),
            albumIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: -Constants.albumIconImageViewTopBottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            trackNameLabel.centerYAnchor.constraint(equalTo: albumIconImageView.centerYAnchor),
            trackNameLabel.leadingAnchor.constraint(equalTo: albumIconImageView.trailingAnchor, constant: Constants.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            durationLabel.centerYAnchor.constraint(equalTo: albumIconImageView.centerYAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: albumIconImageView.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: durationLabel.trailingAnchor),
            divisionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            divisionView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

//MARK: - UIGestureRecognizerDelegate
extension TrackCellView: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let delegate = delegate,
              let trackName = trackNameLabel.text else { return false }
        delegate.openVCwith(name: trackName)
        return true
    }
}
