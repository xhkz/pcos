//
//  ListViewController.swift
//  PCOS
//
//  Created by Xin Huang on 4/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit
import SwiftOverlays
import Alamofire
import SwiftyJSON

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
        
        qTableView.delegate = self
        qTableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        getListData()
        qTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let index = qTableView.indexPathForSelectedRow()!.row
        let viewController = segue.destinationViewController as! EditTableViewController
        viewController.qId = items[index].id
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
        
        if (items[indexPath.row].sync == 0) {
            cell.imageView?.image = UIImage(named: "ToSync")
        } else {
            cell.imageView?.image = UIImage(named: "Synced")
        }
        
        
        return cell
    }
    
    @IBAction func sync(sender: AnyObject) {
        self.showWaitOverlay()
        let defaults = NSUserDefaults.standardUserDefaults()
        let remoteId = defaults.integerForKey(Config.remotePatientID)
        
        let sql = "SELECT * from questionnaire where synced = 0 and patient_id = \(remoteId)"
        printLog(sql)
        
        let (result, err) = SD.executeQuery(sql)
        if err != nil {
            // handle error
        } else {
            if result.count > 0 {
                items.removeAll()
                var finished = 0
                for row in result {
                    var params = [String: AnyObject]()
                    let id: Int! = row["id"]?.asInt()
                    if let bh_arms_pos: String! = row["bh_arms_pos"]?.asString() { params["bh_arms_pos"] = bh_arms_pos}
                    if let bh_breast_pos: String! = row["bh_breast_pos"]?.asString() { params["bh_breast_pos"] = bh_breast_pos}
                    if let bh_chin_pos: String! = row["bh_chin_pos"]?.asString() { params["bh_chin_pos"] = bh_chin_pos}
                    if let bh_escu_pos: String! = row["bh_escu_pos"]?.asString() { params["bh_escu_pos"] = bh_escu_pos}
                    if let bh_lowerback_pos: String! = row["bh_lowerback_pos"]?.asString() { params["bh_lowerback_pos"] = bh_lowerback_pos}
                    if let bh_pubic_pos: String! = row["bh_pubic_pos"]?.asString() { params["bh_pubic_pos"] = bh_pubic_pos}
                    if let bh_unwant: Int! = row["bh_unwant"]?.asInt() { params["bh_unwant"] = bh_unwant }
                    if let bh_unwant_start_age: Int! = row["bh_unwant_start_age"]?.asInt() { params["bh_unwant_start_age"] = bh_unwant_start_age}
                    if let bh_upperback_pos: String! = row["bh_upperback_pos"]?.asString() { params["bh_upperback_pos"] = bh_upperback_pos}
                    if let bh_upperleg_pos: String! = row["bh_upperleg_pos"]?.asString() { params["bh_upperleg_pos"] = bh_upperleg_pos}
                    if let bh_upperlip_pos: String! = row["bh_upperlip_pos"]?.asString() { params["bh_upperlip_pos"] = bh_upperlip_pos}
                    
                    if let diet_after_diner_snack: String! = row["diet_after_diner_snack"]?.asString() { params["diet_after_diner_snack"] = diet_after_diner_snack}
                    if let diet_breakfast_daily: Int! = row["diet_breakfast_daily"]?.asInt() { params["diet_breakfast_daily"] = diet_breakfast_daily}
                    if let diet_late_dinner: Int! = row["diet_late_dinner"]?.asInt() { params["diet_late_dinner"] = diet_late_dinner}
                    if let diet_three_meals_daily: Int! = row["diet_three_meals_daily"]?.asInt() { params["diet_three_meals_daily"] = diet_three_meals_daily}
                    
                    if let date_submitted: String! = row["date_submitted"]?.asString() { params["date_submitted"] = date_submitted}

                    if let exercise_ma_days_pw: Int! = row["exercise_ma_days_pw"]?.asInt() { params["exercise_ma_days_pw"] = exercise_ma_days_pw}
                    if let exercise_ma_mins_pd: Int! = row["exercise_ma_mins_pd"]?.asInt() { params["exercise_ma_mins_pd"] = exercise_ma_mins_pd}
                    if let exercise_sitting_hrs_pd: Int! = row["exercise_sitting_hrs_pd"]?.asInt() { params["exercise_sitting_hrs_pd"] = exercise_sitting_hrs_pd}
                    if let exercise_va_days_pw: Int! = row["exercise_va_days_pw"]?.asInt() { params["exercise_va_days_pw"] = exercise_va_days_pw}
                    if let exercise_va_mins_pd: Int! = row["exercise_va_mins_pd"]?.asInt() { params["exercise_va_mins_pd"] = exercise_va_mins_pd}
                    if let exercise_walking_days_pw: Int! = row["exercise_walking_days_pw"]?.asInt() { params["exercise_walking_days_pw"] = exercise_walking_days_pw}
                    if let exercise_walking_mins_pd: Int! = row["exercise_walking_mins_pd"]?.asInt() { params["exercise_walking_mins_pd"] = exercise_walking_mins_pd}
                    
                    if let mc_absent_date: String! = row["mc_absent_date"]?.asString() {
                        if mc_absent_date != "--01" {
                            params["mc_absent_date"] = mc_absent_date
                        }
                    }
                    if let mc_age: Int! = row["mc_age"]?.asInt() { params["mc_age"] = mc_age}
                    if let mc_irregular_start_age: Int! = row["mc_irregular_start_age"]?.asInt() { params["mc_irregular_start_age"] = mc_irregular_start_age}
                    if let mc_irregular_year_bleeds: Int! = row["mc_irregular_year_bleeds"]?.asInt() { params["mc_irregular_year_bleeds"] = mc_irregular_year_bleeds}
                    if let mc_present_status: String! = row["mc_present_status"]?.asString() { params["mc_present_status"] = mc_present_status}
                    if let mc_regular_days: Int! = row["mc_regular_days"]?.asInt() { params["mc_regular_days"] = mc_regular_days}
                    
                    if let pmh_alcohol: Int! = row["pmh_alcohol"]?.asInt() { params["pmh_alcohol"] = pmh_alcohol}
                    if let pmh_alcohol_week_taken: Int! = row["pmh_alcohol_week_taken"]?.asInt() { params["pmh_alcohol_week_taken"] = pmh_alcohol_week_taken}
                    if let pmh_bc_diagonsed_age: Int! = row["pmh_bc_diagonsed_age"]?.asInt() { params["pmh_bc_diagonsed_age"] = pmh_bc_diagonsed_age}
                    if let pmh_blood_clot: Int! = row["pmh_blood_clot"]?.asInt() { params["pmh_blood_clot"] = pmh_blood_clot}
                    if let pmh_diabetes: Int! = row["pmh_diabetes"]?.asInt() { params["pmh_diabetes"] = pmh_diabetes}
                    if let pmh_diabetes_diagonosed_age: Int! = row["pmh_diabetes_diagonosed_age"]?.asInt() { params["pmh_diabetes_diagonosed_age"] = pmh_diabetes_diagonosed_age}
                    if let pmh_earlier_first_pubic_hair: Int! = row["pmh_earlier_first_pubic_hair"]?.asInt() { params["pmh_earlier_first_pubic_hair"] = pmh_earlier_first_pubic_hair}
                    if let pmh_hbp_diagonosed_age: Int! = row["pmh_hbp_diagonosed_age"]?.asInt() { params["pmh_hbp_diagonosed_age"] = pmh_hbp_diagonosed_age}
                    if let pmh_hc_diagonosed_age: Int! = row["pmh_hc_diagonosed_age"]?.asInt() { params["pmh_hc_diagonosed_age"] = pmh_hc_diagonosed_age}
                    if let pmh_hd_diagonosed_age: Int! = row["pmh_hd_diagonosed_age"]?.asInt() { params["pmh_hd_diagonosed_age"] = pmh_hd_diagonosed_age}
                    if let pmh_heart_disease: Int! = row["pmh_heart_disease"]?.asInt() { params["pmh_heart_disease"] = pmh_heart_disease}
                    if let pmh_high_blood_pressure: Int! = row["pmh_high_blood_pressure"]?.asInt() { params["pmh_high_blood_pressure"] = pmh_high_blood_pressure}
                    if let pmh_high_cholesterol: Int! = row["pmh_high_cholesterol"]?.asInt() { params["pmh_high_cholesterol"] = pmh_high_cholesterol}
                    if let pmh_smoke_day_taken: Int! = row["pmh_smoke_day_taken"]?.asInt() { params["pmh_smoke_day_taken"] = pmh_smoke_day_taken}
                    if let pmh_smoke_status: String! = row["pmh_smoke_status"]?.asString() { params["pmh_smoke_status"] = pmh_smoke_status}
                    if let pmh_smoke_years: Int! = row["pmh_smoke_years"]?.asInt() { params["pmh_smoke_years"] = pmh_smoke_years}
                    if let pmh_underactive_thyroid: Int! = row["pmh_underactive_thyroid"]?.asInt() { params["pmh_underactive_thyroid"] = pmh_underactive_thyroid}
                    if let pmh_ut_diagnosed_age: Int! = row["pmh_ut_diagnosed_age"]?.asInt() { params["pmh_ut_diagnosed_age"] = pmh_ut_diagnosed_age}
                    
                    if let skin_acne: Int! = row["skin_acne"]?.asInt() { params["skin_acne"] = skin_acne}
                    if let skin_acne_start_age: Int! = row["skin_acne_start_age"]?.asInt() { params["skin_acne_start_age"] = skin_acne_start_age}
                    if let sleep_snore: String! = row["sleep_snore"]?.asString() { params["sleep_snore"] = sleep_snore}
                    if let weight_over: Int! = row["weight_over"]?.asInt() { params["weight_over"] = weight_over}
                    if let weight_overyear: Int! = row["weight_overyear"]?.asInt() { params["weight_overyear"] = weight_overyear}
                    if let ethnicity: String! = row["ethnicity"]?.asString() { params["ethnicity"] = ethnicity}
                    
                    if let patient_id: Int! = row["patient_id"]?.asInt() { params["patient_id"] = patient_id}
                    
                    printLog(params)
                    
                    request(.POST, Config.syncUrl, parameters: params, encoding: .JSON)
                        .responseJSON { (req, res, json, error) in
                            if (error == nil) {
                                var j = JSON(json!)
                                printLog(j)
                                
                                let sql = "UPDATE questionnaire SET synced = 1 WHERE id = \(id)"
                                printLog(sql)
                                
                                if let err = SD.executeChange(sql) {
                                    // handle error
                                } else {
                                    // update successfully
                                }
                                
                            } else {
                                printLog(error!)
                            }
                            
                            finished += 1
                            if (finished == result.count) {
                                self.removeAllOverlays()
                                self.getListData()
                                self.qTableView.reloadData()
                                showAlert("All Synced.")
                            }
                    }
                }
            } else {
                self.removeAllOverlays()
                showAlert("All Synced.")
            }
        }
    }
    
    func getListData() {
        let remoteId = NSUserDefaults.standardUserDefaults().integerForKey(Config.remotePatientID)
        let sql = "SELECT q.id as id, u.first_name as fname, u.last_name as lname, q.date_submitted as date, q.synced as sync from questionnaire as q, user as u where q.local_user_id = u.id and q.patient_id = \(remoteId) order by q.date_submitted desc"
        printLog(sql)
        
        let (result, err) = SD.executeQuery(sql)
        if err != nil {
            // handle error
        } else {
            items.removeAll()
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
