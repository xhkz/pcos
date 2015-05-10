//
//  EditTableViewController.swift
//  PCOS
//
//  Created by Xin Huang on 6/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class EditTableViewController: UITableViewController {
    
    var qId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        printLog(qId)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    @IBAction func deleteTapped(sender: AnyObject) {
        let sql = "DELETE FROM questionnaire WHERE id = \(qId)"
        printLog(sql)
        
        if let err = SD.executeChange(sql) {
            printLog(err)
            showAlert("Failed.")
        } else {
            showAlert("Deleted.")
        }

        self.navigationController?.popViewControllerAnimated(true)
    }
}
