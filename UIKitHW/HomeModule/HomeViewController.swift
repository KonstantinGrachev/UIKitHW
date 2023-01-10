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
        static let titleFont: UIFont = .systemFont(ofSize: 30, weight: .heavy)
        
        static let songsStackViewSpacing: CGFloat = 10
        static let appNameLabelHeightAnchor: CGFloat = 20
        
        static let backgroundColor: UIColor = .secondarySystemBackground
        
    }
    
    //MARK: - UI
    private lazy var tracksStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: trackViews)
        stackView.axis = .vertical
        stackView.spacing = Constants.songsStackViewSpacing
        return stackView
    }()
    
    //MARK: Internal properties
    var viewModel: HomeViewModelProtocol?
    var trackViews = [TrackCellView]()
    
    //MARK: - Lifecyclec funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCells()
        setupUI()
    }
    
    //MARK: Private funcs
    
    private func configureCells() {

        guard let trackInfos = viewModel?.trackInfo else { return }
        
        for info in trackInfos {
            let trackView = TrackCellView()
            trackView.delegate = self
            trackView.configure(with: info)
            trackViews.append(trackView)
        }
    }

    private func setupUI() {
        view.backgroundColor = Constants.backgroundColor
        
        let attributes = [NSAttributedString.Key.font: Constants.titleFont]
        navigationController?.navigationBar.titleTextAttributes = attributes
        title = viewModel?.title
        
        let subviews = [tracksStackView]
        subviews.forEach { subview in
            subview.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(subview)
        }
        
        NSLayoutConstraint.activate([
            tracksStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tracksStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tracksStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

//MARK: - TrackCellViewDelegate
extension HomeViewController: TrackCellViewDelegate {
    func openVCwith(trackModel: TrackModel) {
        viewModel?.coordinator.showPlayerScreen(with: trackModel, from: self)
    }
}
