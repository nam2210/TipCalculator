//
//  ViewController.swift
//  ActionOutlet
//
//  Created by Nam Pham on 1/29/17.
//  Copyright © 2017 Nam Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var txtFieldBill: UITextField!
    @IBOutlet weak var sgmTipPercent: UISegmentedControl!
    
    var isFirstTime = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        self.view.alpha = 0;
        UIView.animate(withDuration: 1, animations: {
            self.view.alpha = 1;
            if (self.isFirstTime){
                self.isFirstTime = false;
                self.txtFieldBill.becomeFirstResponder();
            }
            
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        let value = UserDefaults.standard.value(forKey: "INDEX");
        sgmTipPercent.selectedSegmentIndex = value as! Int;
        updateValue();
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
        //save bill
        UserDefaults.standard.set(txtFieldBill.text, forKey: "VALUE");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapBackground(_ sender: Any){
        view.endEditing(true);
    }

    @IBAction func billChange(_ sender: AnyObject) {
        let bill = Double(txtFieldBill.text!) ?? 0;
        let tip = bill * tipPercentage[sgmTipPercent.selectedSegmentIndex];
        let total = bill + tip;
        
        
        lblTip.text = formatCurrencyByLocale(value: tip);
        lblTotal.text = formatCurrencyByLocale(value: total);
        
    }
    
    let tipPercentage = [0.18, 0.2, 0.25];
    
    func updateValue(){
        print("refresh value")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var v : String;
        if(appDelegate.isReset){
            v = "0";
        }else {
            if (UserDefaults.standard.value(forKey: "VALUE") != nil){
                v = (UserDefaults.standard.value(forKey: "VALUE") as! String);
            } else {
                v = "0";
            }
            
            
        }
        
        txtFieldBill.text = v;
        let value = UserDefaults.standard.value(forKey: "INDEX");
        let bill = Double(v) ?? 0;
        let tip = bill * tipPercentage[value as! Int];
        let total = bill + tip;
        
        
        lblTip.text = formatCurrencyByLocale(value: tip);
        lblTotal.text = formatCurrencyByLocale(value: total);
        
    }
    
    
    func formatCurrencyByLocale(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2;
        formatter.locale = Locale(identifier: Locale.current.identifier)
        let result = formatter.string(from: value as NSNumber);
        return result!;
    }
    
    
    
    
}

