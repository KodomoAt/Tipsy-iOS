//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
class CalculateViewController: UIViewController {
    var calculateBill = Bill()
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        calculateBill.numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billAmount = billTextField.text {
            let billAmountConverted = billAmount.replacingOccurrences(of: ",", with: ".")
            let billAmountDouble = Double(billAmountConverted)
            calculateBill.billAmount = billAmountDouble ?? 0.0
            let amountPerPerson = calculateBill.calculateAmountPerPerson()
            performSegue(withIdentifier: "goToResult", sender: self)
            print(amountPerPerson)
            print(calculateBill.formatSentence())
        }
            
                
    
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        switch sender.titleLabel?.text{
        case "0%":
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
            calculateBill.tipPercentage = 0.0
        case "10%":
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
            calculateBill.tipPercentage = 10.0
        default:
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
            calculateBill.tipPercentage = 20.0
            
            
            
        }
        
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "goToResult" {
               let destinationVC = segue.destination as! ResultViewController
               destinationVC.totalPerPerson = calculateBill.getResult()
               destinationVC.sentence = calculateBill.formatSentence()
               
           }
       }
    
}

