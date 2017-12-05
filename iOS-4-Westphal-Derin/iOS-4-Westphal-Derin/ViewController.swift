//
//  ViewController.swift
//  iOS-4-Westphal-Derin
//
//  Created by Christian Westphal on 05.12.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var exchangeUsdValue :Double = 1.1883
    var exchangeBpValue :Double = 0.8810
    var eurValue :Double = 1.00
    var usdValue :Double = 1.1883
    var bpValue :Double = 0.8810
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeUsd.text = String(exchangeUsdValue)
        exchangeBp.text = String(exchangeBpValue)
        eurField.text = String(eurValue)
        
        updateView()
    }

    @IBAction func euroDidEnd(_ sender: UITextField) {
        changeValues()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateExchangerate() {
        usdValue = eurValue * exchangeUsdValue
        bpValue = eurValue * exchangeBpValue
    }
    
    func changeValues() {
        
        if let eurInput = eurField.text{
            eurValue = Double(eurInput)!
        }
        calculateExchangerate()
        updateView()
    }
    
    func updateView() {
        eurField.text = String(format: "%.2lf", eurValue)
        usdField.text = String(format: "%.2lf", usdValue)
        bpField.text = String(format: "%.2lf", bpValue)
    }

    @IBOutlet weak var eurField: UITextField!
    @IBOutlet weak var usdField: UITextField!
    @IBOutlet weak var bpField: UITextField!
    @IBOutlet weak var exchangeUsd: UITextField!
    @IBOutlet weak var exchangeBp: UITextField!
    
}

