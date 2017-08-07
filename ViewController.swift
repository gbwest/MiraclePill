//
//  ViewController.swift
//  MiraclePill
//
//  Created by Gordon West on 8/4/17.
//  Copyright © 2017 Gordon West. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //outlets
    @IBOutlet weak var mainScrollViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pillEmoji: UIImageView!
    @IBOutlet weak var pillsLabel: UILabel!
    @IBOutlet weak var label150: UILabel!
    @IBOutlet weak var NameFld: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var CityFld: UITextField!
    @IBOutlet weak var StreetFld: UITextField!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var CountryFid: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var ZipField: UITextField!
    @IBOutlet weak var zipLabel: UILabel!
    @IBOutlet weak var dividerLabel: UIView!
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var userInfo: UILabel!
    
    //collections of outlets
    @IBOutlet var viewsToHide: [UIImageView]!
    @IBOutlet var labelsToHide: [UILabel]!
    @IBOutlet var fieldsToHide: [UITextField]!

    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        statePicker.dataSource = self
        statePicker.delegate = self
            
        let notificationCenter = NotificationCenter.default
            
            notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            
            notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
            
            
    }
    
    let states = ["Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
    
    var fullName: String = ""
    var streetAddress: String = ""
    var city: String = ""
    var state: String = ""
    var country: String = ""
    var zip: String = ""
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nameEnter(_ sender: UITextField) {
        fullName = sender.text!
    }
    
    @IBAction func sddressEnter(_ sender: UITextField) {
        streetAddress = sender.text!
    }
    
    @IBAction func cityEnter(_ sender: UITextField) {
        city = sender.text!
    }

    @IBAction func countryEnter(_ sender: UITextField) {
        country = sender.text!
    }
    
    @IBAction func zipEnter(_ sender: UITextField) {
        zip = sender.text!
    }
    
    
    @IBAction func stateAction(_ sender: Any) {
        statePicker.isHidden = false
    }


    @IBAction func buyBtnPressed(_ sender: UIButton) {
        
 //       for var view = 0 to viewsToHide.count {
 //       viewsToHide[view].isHidden = true
 //           }

        viewsToHide.forEach({ $0.isHidden = true })
        labelsToHide.forEach({ $0.isHidden = true })
        fieldsToHide.forEach({ $0.isHidden = true })
        stateBtn.isHidden = true
        statePicker.isHidden = true
        dividerLabel.isHidden = true
        
        buyBtn.isHidden = true
        userInfo.isHidden = true
        
        userInfo.isHidden = false
        userInfo.text = fullName + "\n" +
                        streetAddress + "\n" +
                        city  + ", " + state + "\n" +
                        zip + ", " + country + "\n\n" +
                        "4 pmts of $150.00"
        
        pillEmoji.image = UIImage(named: "successIndicator")
        pillEmoji.isHidden = false
        
    }
    
// Manditory functions for pickerview protocol and delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateBtn.setTitle(states[row], for: UIControlState.normal)
        
        state = states[row]
        // stateBtn.isHidden = true
        buyBtn.isHidden = false
    }
    
// Manditory functions for scrolling view NSLayoutconsstraint
    
    func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardHeight =  (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        mainScrollViewBottomConstraint.constant = keyboardHeight.height
    }
    
    func keyboardWillHide(_ notification: Notification) {
        mainScrollViewBottomConstraint.constant = 0
    }
    
    
}   

