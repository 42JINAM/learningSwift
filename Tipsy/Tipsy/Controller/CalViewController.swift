//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var chooseLabel: UILabel!
    var billBrain = BillBrain(totalBill: 0, people: 0, tipRate: 0.2, billPerPerson: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let text = sender.text {
            billBrain.totalBill = Double(text) ?? 0
        }
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == "10%" {
            billBrain.tipRate = 0.1
            button1.isSelected = false
            button3.isSelected = false
        } else if sender.currentTitle == "20%" {
            billBrain.tipRate = 0.2
            button1.isSelected = false
            button2.isSelected = false
        } else {
            billBrain.tipRate = 0.0
            button2.isSelected = false
            button3.isSelected = false
        }
        sender.isSelected = true
    }
    @IBAction func splitterChanged(_ sender: UIStepper) {
        chooseLabel.text = String(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billBrain.people = Double(chooseLabel.text ?? "") ?? 2
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        return super.touchesBegan(touches, with: event)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bill = billBrain.calculateBill()
            destinationVC.sentence = billBrain.getSentence()
        }
    }
}

