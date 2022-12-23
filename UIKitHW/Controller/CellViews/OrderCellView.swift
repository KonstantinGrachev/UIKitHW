//
//  OrderCellView.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import Foundation

import UIKit

class OrderCellView: UIView {
    
    //MARK: Constants
    enum Constants {
        enum Colors {
            static let subheaderTextColor: UIColor = .systemGray2
        }
        
        enum Constraints {
            static let albumIconImageViewSize: CGFloat = 60
            static let topBottomAnchor: CGFloat = 5
            static let sideIndentationAnchor: CGFloat = 10
            static let divisionViewTopAnchor: CGFloat = 5
        }
        
        enum Fonts {
            static let headerLabelFont: UIFont = .boldSystemFont(ofSize: 20)
            static let subheaderLabelFont: UIFont = .systemFont(ofSize: 16)
            static let leftDaysTitleFont: UIFont = .boldSystemFont(ofSize: 16)
        }
    }
    
    private let dishHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.headerLabelFont
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
    
    private let totalSumLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.leftDaysTitleFont
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
    
    convenience init(dishHeaderLabel: String, subHeader: String, totalSumLabel: String) {
        self.init()
        self.dishHeaderLabel.text = dishHeaderLabel
        self.totalSumLabel.text = totalSumLabel
        self.subHeaderLabel.text = subHeader
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderCellView {
    private func setupView() {
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(dishHeaderLabel)
        addSubview(subHeaderLabel)
        addSubview(totalSumLabel)
        addSubview(divisionView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            dishHeaderLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Constraints.topBottomAnchor),
            dishHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            subHeaderLabel.topAnchor.constraint(equalTo: dishHeaderLabel.bottomAnchor, constant: Constants.Constraints.topBottomAnchor),
            subHeaderLabel.leadingAnchor.constraint(equalTo: dishHeaderLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            totalSumLabel.centerYAnchor.constraint(equalTo: dishHeaderLabel.centerYAnchor),
            totalSumLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Constraints.sideIndentationAnchor)
        ])
        
        NSLayoutConstraint.activate([
            divisionView.leadingAnchor.constraint(equalTo: dishHeaderLabel.leadingAnchor),
            divisionView.trailingAnchor.constraint(equalTo: totalSumLabel.trailingAnchor),
            divisionView.topAnchor.constraint(equalTo: subHeaderLabel.bottomAnchor, constant: Constants.Constraints.divisionViewTopAnchor),
            divisionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            divisionView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
