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