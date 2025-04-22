//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        choice1Button.accessibilityIdentifier = "Choice 1"
        choice2Button.accessibilityIdentifier = "Choice 2"
        super.viewDidLoad()
        updateUI()

    }
    func    updateUI(){
        storyLabel.text = storyBrain.getCurrentTitle()
        choice1Button.setTitle(storyBrain.getCurrentChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getCurrentChoice2(), for: .normal)
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(input: sender.accessibilityIdentifier!)
        updateUI()
    }
    
}

