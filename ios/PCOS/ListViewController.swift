//
//  ListViewController.swift
//  PCOS
//
//  Created by Xin Huang on 4/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var qTableView: UITableView!
    let cellIdentifier: String = "cellIdentifier"
    
    
    struct CellItem {
        var id: Int = 0
        var text: String = ""
        var date: String = ""
        var sync: Int = 0
        
        init(id: Int, text: String, date: String, sync: Int) {
            self.id = id
            self.text = text
            self.date = date
            self.sync = sync
        }
    }
    
    
    var items: [CellItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getListData()
        qTableView.delegate = self
        qTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let idx = qTableView.indexPathForSelectedRow()!.row
        let vc = segue.destinationViewController as! EditViewController
        vc.data = items[idx].id
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row].text
        cell.detailTextLabel?.text = items[indexPath.row].date
        
        return cell
    }
    
    func getListData() {
        
        let sql = "SELECT u.id as id, u.first_name as fname, u.last_name as lname, q.date_submitted as date, q.synced as sync from questionnaire as q, user as u where q.local_user_id = u.id order by q.date_submitted desc"
        if Config.debug { println(sql) }
        
        let (result, err) = SD.executeQuery(sql)
        if err != nil {
            // handle error
        } else {
            if result.count > 0 {
                for row in result {
                    let id: Int! = row["id"]?.asInt()
                    let fname: String! = row["fname"]?.asString()
                    let lname: String! = row["lname"]?.asString()
                    let date: String! = row["date"]?.asString()
                    let sync: Int! = row["sync"]?.asInt()
                    
                    items.append(CellItem(id: id, text: fname, date: date, sync: sync))
                }
            }
        }
    }
}
