//
//  ViewController.swift
//  iOS-4-Westphal-Derin
//
//  Created by Christian Westphal on 05.12.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var exchangeUsdValue :Double = 1.1883
    var exchangeBpValue :Double = 0.8810
    var eurValue :Double = 1.00
    var usdValue :Double = 1.1883
    var bpValue :Double = 0.8810
    
    @IBOutlet weak var eurField: UITextField!
    @IBOutlet weak var usdField: UITextField!
    @IBOutlet weak var bpField: UITextField!
    @IBOutlet weak var exchangeUsd: UITextField!
    @IBOutlet weak var exchangeBp: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeUsd.text = String(exchangeUsdValue)
        exchangeBp.text = String(exchangeBpValue)
        eurField.text = String(eurValue)
        
        self.eurField.delegate = self;
        self.usdField.delegate = self;
        self.bpField.delegate = self;
        self.exchangeUsd.delegate = self;
        self.exchangeBp.delegate = self;

        updateView()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    @IBAction func exchangeBpDidEnd(_ sender: UITextField) {
        changeValues()
    }
    @IBAction func exchangeUsdDidEnd(_ sender: UITextField) {
        changeValues()
    }
    @IBAction func eurDidEnd(_ sender: UITextField) {
        changeValues()
    }
    @IBAction func usdDidEnd(_ sender: UITextField) {
        changeValues()
    }
    @IBAction func bpDidEnd(_ sender: UITextField) {
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
        
        if let eurInput = Double(eurField.text!){
            eurValue = eurInput
        }
        if let usdInput = Double(usdField.text!){
            usdValue = usdInput
        }
        if let bpInput = Double(bpField.text!){
            bpValue = bpInput
        }
        if let exchangeUsdInput = Double(exchangeUsd.text!){
            exchangeUsdValue = exchangeUsdInput
        }
        if let exchangeBpInput = Double(exchangeBp.text!){
            exchangeBpValue = exchangeBpInput
        }
        calculateExchangerate()
        updateView()
    }
    
    func updateView() {
        eurField.text = String(format: "%.2lf", eurValue)
        usdField.text = String(format: "%.2lf", usdValue)
        bpField.text = String(format: "%.2lf", bpValue)
        exchangeUsd.text = String(exchangeUsdValue)
        exchangeBp.text = String(exchangeBpValue)
    }
    
}

