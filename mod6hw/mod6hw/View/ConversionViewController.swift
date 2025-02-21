//
//  ConversionViewController.swift
//  mod6hw
//
//  Created by user272531 on 2/19/25.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var currency1Label: UILabel!
    @IBOutlet weak var currency2Label: UILabel!
    @IBOutlet weak var currency3Label: UILabel!
    @IBOutlet weak var currency4Label: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    var usdAmount: Int = 0
    var errorMessage: String = ""
    var currenciesSelected: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !errorMessage.isEmpty {
            errorLabel.text = errorMessage
            errorLabel.isHidden = false
            usdLabel.isHidden = true
            currency1Label.isHidden = true
            currency2Label.isHidden = true
            currency3Label.isHidden = true
            currency4Label.isHidden = true
        } else {
            errorLabel.isHidden = true
            usdLabel.text = "Amount in USD: $\(usdAmount)"

            let currencyLabels = [currency1Label, currency2Label, currency3Label, currency4Label]

            for (index, isSelected) in currenciesSelected.enumerated() {
                if isSelected {
                    let convertedAmount = ConversionLogic.convert(amount: usdAmount, forCurrencyIndex: index)
                    let currencyName = ConversionLogic.getCurrencyName(for: index)
                    currencyLabels[index]?.text = "\(currencyName): \(String(format: "%.2f", convertedAmount))"
                } else {
                        currencyLabels[index]?.isHidden = true
                }
            }
        }
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
