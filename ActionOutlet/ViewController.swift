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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let value = UserDefaults.standard.value(forKey: "INDEX");
        sgmTipPercent.selectedSegmentIndex = value as! Int;
        updateValue();
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapBackground(_ sender: Any){
        view.endEditing(true);
    }

    @IBAction func billChange(_ sender: AnyObject) {
        
        let tipPercentage = [0.18, 0.2, 0.25];
        
        let bill = Double(txtFieldBill.text!) ?? 0;
        let tip = bill * tipPercentage[sgmTipPercent.selectedSegmentIndex];
        let total = bill + tip;
        
        lblTip.text = String(format: "$%.2f", tip);
        lblTotal.text = String(format: "$%.2f", total);
    }
    
    func updateValue(){
        let tipPercentage = [0.18, 0.2, 0.25];
        
        let value = UserDefaults.standard.value(forKey: "INDEX");
        let bill = Double(txtFieldBill.text!) ?? 0;
        let tip = bill * tipPercentage[value as! Int];
        let total = bill + tip;
        
        lblTip.text = String(format: "$%.2f", tip);
        lblTotal.text = String(format: "$%.2f", total);

    }
    
    
    
    
}

