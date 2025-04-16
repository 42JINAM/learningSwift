//
//  ViewController.swift
//  Je Suis Caca
//
//  Created by jinam on 4/14/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var screen: UIView!
    let colors: [UIColor] = [
        UIColor(red:58/255.0, green: 89/255.0, blue: 209/255.0, alpha: 1),
        UIColor(red:61/255.0, green: 144/255.0, blue: 215/255.0, alpha: 1),
        UIColor(red:122/255.0, green: 198/255.0, blue: 210/255.0, alpha: 1),
        UIColor(red:181/255.0, green: 252/255.0, blue: 205/255.0, alpha: 1),
        UIColor(red:214/255.0, green: 123/255.0, blue: 255/255.0, alpha: 1),
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeScreenColor(_ sender: Any) {
        screen.backgroundColor = colors.randomElement()
    }
    
}

