//
//  ResultViewController.swift
//  Tipsy
//
//  Created by jinam on 4/24/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bill: String?
    var sentence: String?
    
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var sentenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billLabel.text = bill
        sentenceLabel.text = sentence

        // Do any additional setup after loading the view.
    }

    @IBAction func reCalcultatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
