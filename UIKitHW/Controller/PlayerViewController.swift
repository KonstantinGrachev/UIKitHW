//
//  PlayerViewController.swift
//  UIKitHW
//
//  Created by Константин Грачев on 23.12.2022.
//

import UIKit

class PlayerViewController: UIViewController {

    var trackName: String
    
    lazy var trackLabel: UILabel = {
        let label = UILabel()
        
        label.center = view.center
        return label
    }()
    
    init(trackName: String) {
        self.trackName = trackName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(trackLabel)
        trackLabel.text = trackName
        print(trackLabel.text)
        view.backgroundColor = .darkGray
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
