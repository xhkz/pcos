//
//  EditViewController.swift
//  PCOS
//
//  Created by Xin Huang on 6/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var data: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        dataLabel.text = String(data)
    }

}
