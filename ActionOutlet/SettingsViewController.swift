//
//  SettingsViewController.swift
//  ActionOutlet
//
//  Created by Nam Pham on 1/29/17.
//  Copyright © 2017 Nam Pham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var sgmDefault: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let value = UserDefaults.standard.value(forKey: "INDEX");
        sgmDefault.selectedSegmentIndex = value as! Int;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickChangeDefaultValue(_ sender: Any) {
        //save 
        UserDefaults.standard.set(sgmDefault.selectedSegmentIndex, forKey: "INDEX");
        
    }
}
