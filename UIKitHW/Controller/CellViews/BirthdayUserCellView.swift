//
//  BirthdayUserCell.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

class BirthdayUserCellView: UIView {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let subheaderTextColor: UIColor = .systemGray2
        }
        
        enum Constraints {
            static let albumIconImageViewSize: CGFloat = 60
            static let albumIconImageViewTopBottomAnchor: CGFloat = 5
            static let sideIndentationAnchor: CGFloat = 10
            
            static let personAvatarSize: CGFloat = 40
        }
        
        enum Fonts {
            static let headerLabelFont: UIFont = .boldSystemFont(ofSize: 20)
            static let subheaderLabelFont: UIFont = .systemFont(ofSize: 16)
            static let leftDaysTitleFont: UIFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    private let userIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.personAvatarSize).isActive = true
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.headerLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftDaysLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.leftDaysTitleFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.subheaderLabelFont
        label.textColor = Constants.Colors.subheaderTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    convenience init(userHeader: String, subHeader: String, leftDays: String, userIcon: UIImage?) {
        self.init()
        self.userHeaderLabel.text = userHeader
        self.leftDaysLabel.text = leftDays
        self.subHeaderLabel.text = subHeader
        self.userIconImageView.image = userIcon
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BirthdayUserCellView {
    private func setupView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        addSubview(userIconImageView)
        addSubview(userHeaderLabel)
        addSubview(subHeaderLabel)
        addSubview(leftDaysLabel)
        addSubview(divisionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userIconImageView.heightAnchor.constraint(equalToConstant: Constants.Constraints.albumIconImageViewSize),
            userIconImageView.widthAnchor.constraint(equalToConstant: Constants.Constraints.albumIconImageViewSize),
            userIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideIndentationAnchor),
            userIconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.Constraints.albumIconImageViewTopBottomAnchor),
            userIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: -Constants.Constraints.albumIconImageViewTopBottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            userHeaderLabel.bottomAnchor.constraint(equalTo: userIconImageView.centerYAnchor),
            userHeaderLabel.leadingAnchor.constraint(equalTo: userIconImageView.trailingAnchor, constant: Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subHeaderLabel.topAnchor.constraint(equalTo: userIconImageView.centerYAnchor),
            subHeaderLabel.leadingAnchor.constraint(equalTo: userIconImageView.trailingAnchor, constant: Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            leftDaysLabel.centerYAnchor.constraint(equalTo: userHeaderLabel.centerYAnchor),
            leftDaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: userIconImageView.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: leftDaysLabel.trailingAnchor),
            divisionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            divisionView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
