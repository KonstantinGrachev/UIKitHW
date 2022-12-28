//
//  CustomLabelScreenButton.swift
//  UIKitHW
//
//  Created by Константин Грачев on 28.12.2022.
//
import UIKit

enum CustomLabelType {
    case topScreenAlbumFromSubheaderLabel
    case topScreenAlbumHeaderLabel
    case trackNameHeaderLabel
    case trackArtistSubheaderLabel
    case durationFromStartLabel
    case durationToEndLabel
    case devicesAvailableLabel
    
    var text: String? {
        switch self {
        case .topScreenAlbumFromSubheaderLabel:
            return "Playing from album"
        case .devicesAvailableLabel:
            return "Devices available"
        default:
            return nil
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .topScreenAlbumFromSubheaderLabel:
            return .gray
        case .topScreenAlbumHeaderLabel:
            return .black
        case .trackNameHeaderLabel:
            return .black
        case .trackArtistSubheaderLabel:
            return .gray
        case .durationFromStartLabel:
            return .systemGray4
        case .durationToEndLabel:
            return .systemGray4
        case .devicesAvailableLabel:
            return .systemGray2
        }
    }
    
    var font: UIFont {
        switch self {
        case .topScreenAlbumFromSubheaderLabel:
            return .systemFont(ofSize: 14, weight: .light)
        case .topScreenAlbumHeaderLabel:
            return .systemFont(ofSize: 16, weight: .bold)
        case .trackNameHeaderLabel:
            return .systemFont(ofSize: 18, weight: .bold)
        case .trackArtistSubheaderLabel:
            return .systemFont(ofSize: 14, weight: .light)
        case .durationFromStartLabel:
            return .systemFont(ofSize: 12, weight: .light)
        case .durationToEndLabel:
            return .systemFont(ofSize: 12, weight: .light)
        case .devicesAvailableLabel:
            return .systemFont(ofSize: 14, weight: .light)
        }
    }
}

final class CustomPlayerScreenLabel: UILabel {
    private var type: CustomLabelType = .devicesAvailableLabel
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(type: CustomLabelType) {
        self.type = type
        text = type.text
        textColor = type.textColor
        font = type.font
    }
}

