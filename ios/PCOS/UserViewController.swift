//
//  UserViewController.swift
//  PCOS
//
//  Created by Xin Huang on 21/04/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class UserViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var dobTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logoutBtn: UIButton!
    
    var datePickerView: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dobTextField.delegate = self
        
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
        formatter.dateFormat = "dd/MM/yyyy"
        self.dobTextField.text = formatter.stringFromDate(sender.date)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func showAlert(title:String, message:String) {
        var alertView:UIAlertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.delegate = self
        alertView.addButtonWithTitle("OK")
        alertView.show()
    }
    
    @IBAction func loginTouched(sender: AnyObject) {
        var firstName = firstNameText.text
        var lastName = lastNameText.text
        var dob = dobTextField.text
        
        var params = [
            "first_name": firstName,
            "last_name": lastName,
            "dob": dob
        ]
        
        request(.POST, Config.loginUrl, parameters: params, encoding: .JSON)
            .responseJSON { (_, _, JSON, _) in
                println(JSON)
        }
    }
}