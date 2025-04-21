//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    var player: AVAudioPlayer!
    
    var timer = Timer()
    let seconds = 1
    let eggTimes : [String : Int] = [
        "Soft" : 5,
        "Medium" : 7,
        "Hard" : 12
        
    ]
    var count : Int = 0;
    var totalTime = 0;
    func startCountDown(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter(){
        if count > 0 {
            progressBar.progress += 1.0 / Float(totalTime)
            count -= 1
        } else {
            titleLabel.text = "DONE!"
            playSound()
            timer.invalidate()
        }
    }
    @IBAction func hardnessSelected(_ sender: UIButton) {
        titleLabel.text = sender.currentTitle
        timer.invalidate()
        progressBar.progress = 0
        totalTime = eggTimes[sender.currentTitle!]! * seconds
        count = totalTime
        startCountDown()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
