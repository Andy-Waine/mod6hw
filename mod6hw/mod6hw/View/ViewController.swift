//
//  ViewController.swift
//  mod6hw
//
//  Created by user272531 on 2/19/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usdTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var currency1Switch: UISwitch!
    @IBOutlet weak var currency2Switch: UISwitch!
    @IBOutlet weak var currency3Switch: UISwitch!
    @IBOutlet weak var currency4Switch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.isHidden = true
    }
    

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        if let _ = Int(usdTextField.text ?? "") {
            errorLabel.isHidden = true
        } else {
            errorLabel.text = "Please enter a valid integer amount."
            errorLabel.isHidden = false
        }
        
        performSegue(withIdentifier: "toConversionView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toConversionView",
           let destinationVC = segue.destination as? ConversionViewController {
            
            if let usdAmount = Int(usdTextField.text ?? "") {
                destinationVC.usdAmount = usdAmount
                destinationVC.errorMessage = ""
                destinationVC.currenciesSelected = [
                    currency1Switch.isOn,
                    currency2Switch.isOn,
                    currency3Switch.isOn,
                    currency4Switch.isOn
                ]
            } else {
                destinationVC.usdAmount = 0
                destinationVC.errorMessage = "Please enter a valid integer amount."
            }
        }
    }
}

