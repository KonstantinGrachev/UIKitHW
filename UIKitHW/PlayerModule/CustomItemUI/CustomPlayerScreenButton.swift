//
//  UIButton+Extensions.swift
//  UIKitHW
//
//  Created by Константин Грачев on 28.12.2022.
//

import UIKit

enum CustomButtonType {
    case dismissChevron
    case shareActivity
    case infoDescription
    case shufflePlayer
    case addToPlaylist
    case previousPlayer
    case playPausePlayer
    case nextPlayer
    case repeatPlayer
    
    var image: UIImage? { //some titles
        switch self {
        case .dismissChevron:
            return UIImage(systemName: "chevron.down")
        case .shareActivity:
            return UIImage(systemName: "square.and.arrow.up")
        case .infoDescription:
            return UIImage(systemName: "ellipsis")
        case .shufflePlayer:
            return UIImage(systemName: "shuffle")
        case .previousPlayer:
            return UIImage(systemName: "backward.end.fill")
        case .playPausePlayer:
            return UIImage(systemName: "play.fill")
        case .nextPlayer:
            return UIImage(systemName: "forward.end.fill")
        case .repeatPlayer:
            return UIImage(systemName: "repeat")
        case .addToPlaylist:
            return UIImage(systemName: "plus")
        }
    }
    
    var tintColor: UIColor {
        switch self {
        case .dismissChevron:
            return UIColor.gray
        case .shareActivity:
            return UIColor.gray
        case .infoDescription:
            return UIColor.gray
        case .shufflePlayer:
            return UIColor.gray
        case .previousPlayer:
            return UIColor.black
        case .playPausePlayer:
            return UIColor.black
        case .nextPlayer:
            return UIColor.black
        case .repeatPlayer:
            return UIColor.gray
        case .addToPlaylist:
            return UIColor.gray
        }
    }
}

final class CustomPlayerScreenButton: UIButton {
    private var type: CustomButtonType = .dismissChevron
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(type: CustomButtonType, with target: Any?, _ action: Selector) {
        self.type = type
        setImage(type.image, for: .normal)
        tintColor = type.tintColor
        self.addTarget(target, action: action, for: .touchUpInside)
        
        switch type {
        case .previousPlayer, .nextPlayer:
            contentHorizontalAlignment = .fill
            contentVerticalAlignment = .fill
            imageView?.contentMode = .scaleAspectFit
        case .playPausePlayer:
            contentHorizontalAlignment = .fill
            contentVerticalAlignment = .fill
            imageView?.contentMode = .scaleAspectFit
        default:
            return
        }
    }
}
