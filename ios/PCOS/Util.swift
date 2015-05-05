//
//  View.swift
//  PCOS
//
//  Created by Xin Huang on 4/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

func showAlert(message:String) {
    var alertView:UIAlertView = UIAlertView()
    alertView.message = message
    alertView.addButtonWithTitle("OK")
    alertView.show()
}

extension String {
    
    subscript (i: Int) -> Character {
        if count(self) == 0 {
            return "0"
        }
        return self[advance(self.startIndex, i)]
    }
    
    subscript (i: Int) -> String {
        if count(self) == 0 {
            return "0"
        }
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}

func clearDefaults() {
    //clear defaults
    for key in NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(key.description)
    }
}

func getUserLocalId() -> Int? {
    let defaults = NSUserDefaults.standardUserDefaults()
    let firstName:String! = defaults.stringForKey(Config.firstNameKey)
    let lastName:String! = defaults.stringForKey(Config.lastNameKey)
    let email:String! = defaults.stringForKey(Config.emailKey)
    let dob:String! = defaults.stringForKey(Config.dobKey)
    
    let sql = "SELECT id FROM user WHERE first_name = '\(firstName)' and last_name = '\(lastName)' and email = '\(email)' and date_of_birth = '\(dob)'"
    if Config.debug { println(sql) }
    
    let (resultSet, err) = SD.executeQuery(sql)
    if err != nil {
        return nil
    } else {
        if resultSet.count > 0 {
            return resultSet[0]["id"]?.asInt()
        } else {
            return 0
        }
    }
}

func nilToNull(obj: AnyObject?) -> AnyObject?{
    if obj == nil {
        return "NULL"
    } else {
        return obj
    }
}
