//
//  ViewController.swift
//  iOS-4-Westphal-Derin
//
//  Created by Christian Westphal on 05.12.17.
//  Copyright © 2017 Christian Westphal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var exchangeUsdValue :Double = 4.123
    var exchangeBpValue :Double = 10.123
    var eurValue :Double = 1.00
    var usdValue :Double = 4.123
    var bpValue :Double = 10.123
    
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func getExchangeValueEurToUs() -> Double {
        if let url = URL(string: "https://finance.google.com/finance/converter?a=1&from=EUR&to=USD") {
            let exchangeValue = self.exchangeValueBody(url: url)
            return exchangeValue
        }
        return 0.0
    }
    
    func getExchangeValueEurToGbp() -> Double {
        if let url = URL(string: "https://finance.google.com/finance/converter?a=1&from=EUR&to=GBP") {
            let exchangeValue =  self.exchangeValueBody(url: url)
            return exchangeValue
        }
        return 0.0
    }
    
    func exchangeValueBody(url: URL) -> Double {
        do {
            let encodedUrl = try String(contentsOf: url, encoding: .isoLatin1)
            let regex = "(?<= \\<span class=bld>)(.*)(?=\\ )"
            if let range = encodedUrl.range(of: regex, options: .regularExpression){
                let exchangeValueString = String(encodedUrl[range])
                if let exchangeValueDouble = Double(exchangeValueString) {
                    print(exchangeValueDouble)
                    return exchangeValueDouble
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
        return 0.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    @IBAction func updateExchangeValueEurToGbp(_ sender: UITextField) {
        exchangeBp.text! = String(self.getExchangeValueEurToGbp());
        self.changeValues()
    }

    @IBAction func updateExchangeValueEurToUsd(_ sender: UITextField) {
        exchangeUsd.text! = String(self.getExchangeValueEurToUs());
        self.changeValues()
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

