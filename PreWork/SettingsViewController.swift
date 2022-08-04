//
//  SettingsViewController.swift
//  PreWork
//
//  Created by Boris Ofon on 8/3/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipOneTextField: UITextField!
    
    @IBOutlet weak var tipTwoTextField: UITextField!
    
    @IBOutlet weak var tipThreeTipField: UITextField!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        
        let tipOne = tipOneTextField.text
        let tipTwo = tipTwoTextField.text
        let tipThree = tipThreeTipField.text
        defaults.set(tipOne, forKey: "SavedTipOne")
        defaults.set(tipTwo, forKey: "SavedTipTwo")
        defaults.set(tipThree, forKey: "SavedTipThree")
        
        defaults.synchronize()
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
