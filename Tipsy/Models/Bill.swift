//
//  Bill.swift
//  Tipsy
//
//  Created by Guillaume Staub on 26/08/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit
struct Bill {
    var billAmount : Double
    var tipPercentage : Double
    var numberOfPeople : Int
    var sentence : String
    var totelPerPersonResult : Double
    
    init(percentage : Double = 0.0, amount : Double = 0.0, people : Int = 2, sentence : String = "Split between 2 people, with 0% tip.", result : Double = 0.0) {
        self.tipPercentage = percentage
        self.billAmount = amount
        self.numberOfPeople = people
        self.sentence = sentence
        self.totelPerPersonResult = result
    }
    func calculateTotalAmount() -> Double {
        return self.billAmount + calculateTipAmount()
    }
    
    func calculateTipAmount() -> Double {
        return billAmount * (tipPercentage/100)
    }
    
    mutating func calculateAmountPerPerson() {
        self.totelPerPersonResult = calculateTotalAmount() / Double(self.numberOfPeople)
       
        
       
    }
    
    func getResult() -> String {
        return String(format: "%.2f€", self.totelPerPersonResult)
    }
    
    mutating func formatSentence() -> String {
        self.sentence = "Split between \(self.numberOfPeople) people, with \(Int(self.tipPercentage))% tip."
        
        return self.sentence
    }
}
