//
//  UserViewController.swift
//  PCOS
//
//  Created by Xin Huang on 21/04/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    var datePickerView: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dobTextField.delegate = self
        
        if let firstName = self.defaults.stringForKey(Config.firstNameKey) { self.firstNameText.text = firstName }
        if let lastName = self.defaults.stringForKey(Config.lastNameKey) { self.lastNameText.text = lastName }
        if let email = self.defaults.stringForKey(Config.emailKey) { self.emailText.text = email }
        if let dob = self.defaults.stringForKey(Config.dobKey) { self.dobTextField.text = dob }
        let remoteId = self.defaults.integerForKey(Config.remotePatientID)
        if remoteId == 0 {
            self.resetInput()
        } else {
            self.disableInput()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dateOfBirthTapped(sender: UITextField) {
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerSelected:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func datePickerSelected(sender: UIDatePicker) {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.dobTextField.text = formatter.stringFromDate(sender.date)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func saveUserLocally() -> Bool {
        let firstName:String! = self.defaults.stringForKey(Config.firstNameKey)
        let lastName:String! = self.defaults.stringForKey(Config.lastNameKey)
        let email:String! = self.defaults.stringForKey(Config.emailKey)
        let dob:String! = self.defaults.stringForKey(Config.dobKey)
        
        let sql = "INSERT INTO user (first_name, last_name, email, date_of_birth) VALUES ('\(firstName)', '\(lastName)', '\(email)', '\(dob)')"
        if Config.debug { println(sql) }
        
        if let err = SD.executeChange(sql) {
            return false
        } else {
            return true
        }
    }
    
    func disableInput() {
        //disable inputs
        self.firstNameText.enabled = false
        self.firstNameText.backgroundColor = UIColor.lightGrayColor()
        self.lastNameText.enabled = false
        self.lastNameText.backgroundColor = UIColor.lightGrayColor()
        self.emailText.enabled = false
        self.emailText.backgroundColor = UIColor.lightGrayColor()
        self.dobTextField.enabled = false
        self.dobTextField.backgroundColor = UIColor.lightGrayColor()
        
        self.loginBtn.enabled = false || Config.debug
        self.loginBtn.setTitleColor(UIColor.lightGrayColor(), forState: UIControlState.Normal)
        
    }
    
    func resetInput() {
        self.firstNameText.text = ""
        self.firstNameText.enabled = true
        self.firstNameText.backgroundColor = UIColor.whiteColor()
        
        self.lastNameText.text = ""
        self.lastNameText.enabled = true
        self.lastNameText.backgroundColor = UIColor.whiteColor()
        
        self.emailText.text = ""
        self.emailText.enabled = true
        self.emailText.backgroundColor = UIColor.whiteColor()
        
        self.dobTextField.text = ""
        self.dobTextField.enabled = true
        self.dobTextField.backgroundColor = UIColor.whiteColor()
        
        self.loginBtn.enabled = true
        self.loginBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }

    @IBAction func loginTouched(sender: AnyObject) {
        var firstName:String! = firstNameText.text
        var lastName:String! = lastNameText.text
        var email:String! = emailText.text
        var dob:String! = dobTextField.text
        
        if (firstName == "" || lastName == "" || email == "" || dob == "") {
            showAlert("Please fill all the blanks.")
            return
        }
        
        var params = [
            "first_name": firstName,
            "last_name": lastName,
            "email": email,
            "dob": dob
        ]
        
        request(.POST, Config.loginUrl, parameters: params, encoding: .JSON)
            .responseJSON { (req, res, json, error) in
                if (error == nil) {
                    var json = JSON(json!)
                    let result:String = json["result"].stringValue
                    let message:String = json["message"].stringValue
                    showAlert(message)
                    
                    if (result == "success") {
                        //set defaults
                        self.defaults.setObject(firstName, forKey: Config.firstNameKey)
                        self.defaults.setObject(lastName, forKey: Config.lastNameKey)
                        self.defaults.setObject(email, forKey: Config.emailKey)
                        self.defaults.setObject(dob, forKey: Config.dobKey)
                        self.defaults.setInteger(json["patient_id"].intValue, forKey: Config.remotePatientID)
                        
                        //save locally
                        let userId = getUserLocalId()
                        if userId == 0 {
                            if (!self.saveUserLocally()) {
                                showAlert("Please relogin")
                                clearDefaults()
                            }
                        }
                        
                        self.disableInput()
                    }
                }
        }
    }
    
    @IBAction func logoutTouched(sender: AnyObject) {
        self.resetInput()
        clearDefaults()
    }
}