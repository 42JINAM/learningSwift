//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        let titleText = "⚡️FlashChat"
        titleLabel.showTitleAnimation(title: titleText)
    }
}

extension UILabel {
    func showTitleAnimation(title : String) {
        var charIndex : Double = 0
        for letter in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.text?.append(letter)
            }
            charIndex += 1
        }
        
    }
}
