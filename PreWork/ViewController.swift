//
//  ViewController.swift
//  PreWork
//
//  Created by Boris Ofon on 8/1/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSliderLabel: UISlider!
    @IBOutlet weak var splitTextField: UITextField!
    
    var tipValue : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetDefaults()
        self.billAmountTextField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let defaults = UserDefaults.standard
        let tipOne = defaults.string(forKey: "SavedTipOne") ?? "15"
        let tipTwo = defaults.string(forKey: "SavedTipTwo") ?? "18"
        let tipThree = defaults.string(forKey: "SavedTipThree") ?? "20"
        tipControl.setTitle(tipOne, forSegmentAt: 0)
        tipControl.setTitle(tipTwo, forSegmentAt: 1)
        tipControl.setTitle(tipThree, forSegmentAt: 2)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [Double(tipControl.titleForSegment(at: 0)!) ?? 0.15 , Double(tipControl.titleForSegment(at: 1)!) ?? 0.18 ,Double(tipControl.titleForSegment(at: 2)!) ?? 0.20]
        
        let segmentIndex = tipControl.selectedSegmentIndex
        tipValue = (Double(tipPercentages[segmentIndex]))/100 * (Double(billAmountTextField.text!) ?? 0)
        tipAmountLabel.text = String(format: "$%.2f", tipValue)
    }
    
    @IBAction func tipSlider(_ sender: UISlider) {
        tipValue = Double(tipSliderLabel.value) * (Double(billAmountTextField.text!) ?? 0)
        tipAmountLabel.text = String(format: "$%.2f", tipValue)
    }
    
    @IBAction func calculateTipButton(_ sender: UIButton) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let numberOfPeople = Double(splitTextField.text!) ?? 1
        let total = (bill + tipValue)/numberOfPeople
        
        tipAmountLabel.text = String(format: "$%.2f", tipValue)
        totalLabel.text = String(format: "$%.2f", total)
        
        self.view.endEditing(true)
    }
    
    @IBAction func resetAllButton(_ sender: Any) {
        billAmountTextField.text = "0"
        tipValue = 0.0
        tipAmountLabel.text = String(format: "$%.2f", tipValue)
        totalLabel.text = String(format: "$%.2f", 0.0)
        
    }
    
    func resetDefaults() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
}

