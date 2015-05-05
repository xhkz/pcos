//
//  QuestionViewController.swift
//  PCOS
//
//  Created by Xin Huang on 21/04/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    // Menstrual Cycle
    @IBOutlet weak var mcAgeText: UITextField!
    @IBOutlet weak var regularBtn: UIButton!
    @IBOutlet weak var irregularBtn: UIButton!
    @IBOutlet weak var absentBtn: UIButton!
    var mcRadio = SSRadioButtonsController()
    @IBOutlet weak var mcRegularText: UITextField!
    @IBOutlet weak var mcIrregularBleedsText: UITextField!
    @IBOutlet weak var mcIrregularStartText: UITextField!
    @IBOutlet weak var mcAbsentYearText: UITextField!
    @IBOutlet weak var mcAbsentMonthText: UITextField!

    // Body Hair
    @IBOutlet weak var bhNoBtn: UIButton!
    @IBOutlet weak var bhYesBtn: UIButton!
    var bhRadio = SSRadioButtonsController()
    @IBOutlet weak var bhStartText: UITextField!
    @IBOutlet weak var bhUpperLipText: UITextField!
    @IBOutlet weak var bhCheekText: UITextField!
    @IBOutlet weak var bhChestText: UITextField!
    @IBOutlet weak var bhBellyText: UITextField!
    @IBOutlet weak var bhPubesText: UITextField!
    @IBOutlet weak var bhArmsText: UITextField!
    @IBOutlet weak var bhThighText: UITextField!
    @IBOutlet weak var bhBackText: UITextField!
    @IBOutlet weak var bhWaistText: UITextField!
    
    // Skin
    @IBOutlet weak var skinAcneNoBtn: UIButton!
    @IBOutlet weak var skinAcneYesBtn: UIButton!
    var skinAcneRadio = SSRadioButtonsController()
    @IBOutlet weak var skinAcneStartText: UITextField!
    
    // Weight
    @IBOutlet weak var weightNoBtn: UIButton!
    @IBOutlet weak var weightYesBtn: UIButton!
    var weightRadio = SSRadioButtonsController()
    @IBOutlet weak var weightStartText: UITextField!
    
    // Ethnicity
    @IBOutlet weak var ethnicityPicker: UIPickerView!
    var ethnicities :[String] = []
    
    // Past medical history
    @IBOutlet weak var pmhAge8NoBtn: UIButton!
    @IBOutlet weak var pmhAge8YesBtn: UIButton!
    var age8Radio = SSRadioButtonsController()
    
    @IBOutlet weak var pmhDiabetesNoBtn: UIButton!
    @IBOutlet weak var pmhDiabetesYesBtn: UIButton!
    var diabetesRadio = SSRadioButtonsController()
    @IBOutlet weak var diabetesDiagText: UITextField!
    
    @IBOutlet weak var pmhHbpNoBtn: UIButton!
    @IBOutlet weak var pmhHbpYesBtn: UIButton!
    var hbpRadio = SSRadioButtonsController()
    @IBOutlet weak var hbpDiagText: UITextField!
    
    @IBOutlet weak var pmhHcNoBtn: UIButton!
    @IBOutlet weak var pmhHcYesBtn: UIButton!
    var hcRadio = SSRadioButtonsController()
    @IBOutlet weak var hcDiagText: UITextField!
    
    @IBOutlet weak var pmhUtNoBtn: UIButton!
    @IBOutlet weak var pmhUtYesBtn: UIButton!
    var utRadio = SSRadioButtonsController()
    @IBOutlet weak var utDiagText: UITextField!
    
    @IBOutlet weak var pmhHdNoBtn: UIButton!
    @IBOutlet weak var pmhHdYesBtn: UIButton!
    var hdRadio = SSRadioButtonsController()
    @IBOutlet weak var hdDiagText: UITextField!
    
    @IBOutlet weak var pmhBcNoBtn: UIButton!
    @IBOutlet weak var pmhBcYesBtn: UIButton!
    var bcRadio = SSRadioButtonsController()
    @IBOutlet weak var bcDiagText: UITextField!
    
    @IBOutlet weak var smokeNeverBtn: UIButton!
    @IBOutlet weak var smokePrevBtn: UIButton!
    @IBOutlet weak var smokeCurBtn: UIButton!
    var smokeRadio = SSRadioButtonsController()
    @IBOutlet weak var smokeCigarText: UITextField!
    @IBOutlet weak var smokeYearText: UITextField!

    @IBOutlet weak var alcoholNoBtn: UIButton!
    @IBOutlet weak var alcoholYesBtn: UIButton!
    var alcoholRadio = SSRadioButtonsController()
    @IBOutlet weak var alcoholUnitText: UITextField!
    
    // Diet
    @IBOutlet weak var breakfastNoBtn: UIButton!
    @IBOutlet weak var breakfastYesBtn: UIButton!
    var breakfastRadio = SSRadioButtonsController()
    
    @IBOutlet weak var lateDinnerNoBtn: UIButton!
    @IBOutlet weak var lateDinnerYesBtn: UIButton!
    var lateDinnerRadio = SSRadioButtonsController()
    
    @IBOutlet weak var snackNeverBtn: UIButton!
    @IBOutlet weak var snackSometimesBtn: UIButton!
    @IBOutlet weak var snackOftenBtn: UIButton!
    var snackRadio = SSRadioButtonsController()
    
    @IBOutlet weak var regularMealNoBtn: UIButton!
    @IBOutlet weak var regularMealYesBtn: UIButton!
    var regularMealRadio = SSRadioButtonsController()
    
    // Exercise
    @IBOutlet weak var exVpDpwText: UITextField!
    @IBOutlet weak var exVpMpdText: UITextField!
    @IBOutlet weak var exMpDpwText: UITextField!
    @IBOutlet weak var exMpMpdText: UITextField!
    @IBOutlet weak var exWalkDpwText: UITextField!
    @IBOutlet weak var exWalkMpdText: UITextField!
    @IBOutlet weak var exSitHpdText: UITextField!
    
    // Sleep
    @IBOutlet weak var snoreNoBtn: UIButton!
    @IBOutlet weak var snoreYesBtn: UIButton!
    @IBOutlet weak var snoreUnknownBtn: UIButton!
    var snoreRadio = SSRadioButtonsController()
    
    // Save form
    @IBOutlet weak var saveBtn: UIButton!
    
    var pickedEthnicity: String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.ethnicityPicker.dataSource = self
        self.ethnicityPicker.delegate = self
        ethnicities = [
            "11 White – British",
            "12 White – Irish",
            "19 Other White background",
            "21 Black or Black British-Caribbean",
            "22 Black or Black British-African",
            "29 Other Black Background",
            "31 Asian or Asian British-Indian",
            "32 Asian or Asian British-Pakistani",
            "33 Asian or Asian British-Bangladeshi",
            "34 Chinese",
            "39 Other Asian background",
            "41 Mixed – White and Black Caribbean",
            "42 Mixed – White and Black African",
            "43 Mixed – White and Asian",
            "49 Other Mixed Background",
            "80 Other Ethnic Background",
            "90 Not Known",
            "98 Information refused"
        ]
        
        pickedEthnicity = ethnicities[0]
        
        mcRadio.setButtonsArray([regularBtn!, irregularBtn!, absentBtn!])
        bhRadio.setButtonsArray([bhNoBtn!, bhYesBtn!])
        skinAcneRadio.setButtonsArray([skinAcneNoBtn!, skinAcneYesBtn!])
        weightRadio.setButtonsArray([weightNoBtn!, weightYesBtn])
        age8Radio.setButtonsArray([pmhAge8NoBtn!, pmhAge8YesBtn!])
        diabetesRadio.setButtonsArray([pmhDiabetesNoBtn!, pmhDiabetesYesBtn!])
        hbpRadio.setButtonsArray([pmhHbpNoBtn!, pmhHbpYesBtn!])
        hcRadio.setButtonsArray([pmhHcNoBtn!, pmhHcYesBtn!])
        utRadio.setButtonsArray([pmhUtNoBtn!, pmhUtYesBtn!])
        hdRadio.setButtonsArray([pmhHdNoBtn!, pmhHdYesBtn!])
        bcRadio.setButtonsArray([pmhBcNoBtn!, pmhBcYesBtn!])
        smokeRadio.setButtonsArray([smokeNeverBtn!, smokePrevBtn!, smokeCurBtn!])
        alcoholRadio.setButtonsArray([alcoholNoBtn!, alcoholYesBtn!])
        breakfastRadio.setButtonsArray([breakfastNoBtn!, breakfastYesBtn!])
        lateDinnerRadio.setButtonsArray([lateDinnerNoBtn!, lateDinnerYesBtn!])
        snackRadio.setButtonsArray([snackNeverBtn!, snackSometimesBtn!, snackOftenBtn!])
        regularMealRadio.setButtonsArray([regularMealNoBtn!, regularMealYesBtn!])
        snoreRadio.setButtonsArray([snoreNoBtn!, snoreYesBtn!, snoreUnknownBtn!])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return ethnicities.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return ethnicities[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        pickedEthnicity = ethnicities[row]
    }
    
    func yesNoToInt(radio: SSRadioButtonsController) -> Int {
        if let selected = radio.selectedButton() {
            if selected.currentTitle! == "Yes" {
                return 1
            }
        }
        
        return 0
    }
    
    func radioText(radio: SSRadioButtonsController) -> String {
        if let selected = radio.selectedButton() {
            return selected.currentTitle!
        }
        
        return ""
    }
    
    func validateInputs() -> Bool {
        // TODO: Validate all inputs
        return false
    }
    
    @IBAction func saveLocally(sender: AnyObject) {

        // Menstrual Cycle
        let mcAge: Int! = mcAgeText.text.toInt()
        let mcStatus: String = radioText(mcRadio)
        let mcRegular: Int! = mcRegularText.text.toInt()
        let mcIrregularBleeds: Int! = mcIrregularBleedsText.text.toInt()
        let mcIrregularStart: Int! = mcIrregularStartText.text.toInt()
        
        let mcAbsentYear: String = mcAbsentYearText.text
        let mcAbsentMonth: String = mcAbsentMonthText.text
        let mcAbsentDate: String = "\(mcAbsentYear)-\(mcAbsentMonth)-01"
        
        // Body Hair
        let bhUnwant: Int! = yesNoToInt(bhRadio)
        let bhStartAge: Int! = bhStartText.text.toInt()
        let bhUpperLip: String = bhUpperLipText.text[0]
        let bhChin: String = bhCheekText.text[0]
        let bhBreast: String = bhChestText.text[0]
        let bhEscu: String = bhBellyText.text[0]
        let bhPublic: String = bhPubesText.text[0]
        let bhArms: String = bhArmsText.text[0]
        let bhUpperLeg: String = bhThighText.text[0]
        let bhUpperBack: String = bhBackText.text[0]
        let bhLowerBack: String = bhWaistText.text[0]
        
        // Skin
        let skinAcne: Int! = yesNoToInt(skinAcneRadio)
        let skinAcneStartAge: Int! = skinAcneStartText.text.toInt()
        
        // Weight
        let weightOver: Int! = yesNoToInt(weightRadio)
        let weightOverYear: Int! = weightStartText.text.toInt()
        
        // Ethnicity
        let ethnicity: String = pickedEthnicity
        
        // Past medical history
        let pmhEarlyPublicHair: Int! = yesNoToInt(age8Radio)
        let pmhDiabetes: Int! = yesNoToInt(diabetesRadio)
        let pmhDiabetesDiagAge: Int! = diabetesDiagText.text.toInt()
        
        let pmhHbp: Int! = yesNoToInt(hbpRadio)
        let pmhHbpDiagAge: Int! = hbpDiagText.text.toInt()
        
        let pmhHc: Int! = yesNoToInt(hcRadio)
        let pmhHcDiagAge: Int! = hcDiagText.text.toInt()
        
        let pmhUt: Int! = yesNoToInt(utRadio)
        let pmhUtDiagAge: Int! = utDiagText.text.toInt()
        
        let pmhHd: Int! = yesNoToInt(hdRadio)
        let pmhHdDiagAge: Int! = hdDiagText.text.toInt()
        
        let pmhBc: Int! = yesNoToInt(bcRadio)
        let pmhBcDiagAge: Int! = bcDiagText.text.toInt()
        
        let pmhSmokeStatus: String = radioText(smokeRadio)
        let pmhSmokeTaken: Int! = smokeCigarText.text.toInt()
        let pmhSmokeYear: Int! = smokeYearText.text.toInt()
        
        let pmhAlcohol: Int! = yesNoToInt(alcoholRadio)
        let pmhAlcoholWeekTaken: Int! = alcoholUnitText.text.toInt()
        
        // Diet
        let dietBreakfast: Int! = yesNoToInt(breakfastRadio)
        let dietLateDinner: Int! = yesNoToInt(lateDinnerRadio)
        let dietSnack: String = radioText(snackRadio)
        let dietThreeMeals: Int! = yesNoToInt(regularMealRadio)
        
        // Exercise
        let exVaDaysPerWeek: Int! = exVpDpwText.text.toInt()
        let exVaMinsPerDay: Int! = exVpMpdText.text.toInt()
        let exMaDaysPerWeek: Int! = exMpDpwText.text.toInt()
        let exMaMinsPerDay: Int! = exMpMpdText.text.toInt()
        let exWalkDaysPerWeek: Int! = exWalkDpwText.text.toInt()
        let exWalkMinsPerDay: Int! = exWalkMpdText.text.toInt()
        let exSitHoursPerDay: Int! = exSitHpdText.text.toInt()
        
        // Sleep
        let sleepSnore: String = radioText(snoreRadio)
        
        // user defined
        let patientId: Int! = NSUserDefaults.standardUserDefaults().integerForKey(Config.remotePatientID)
        let sync: Int! = 0
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateSubmit: String = formatter.stringFromDate(NSDate())
        let localId: Int! = getUserLocalId()
        
        if localId == 0 {
            showAlert("Please at least logged in once.")
            return
        }
        
        // TODO
        validateInputs()
        
        var sql: String = "INSERT INTO questionnaire (bh_arms_pos, bh_breast_pos, bh_chin_pos, bh_escu_pos, bh_lowerback_pos, bh_pubic_pos, bh_unwant, bh_unwant_start_age, bh_upperback_pos, bh_upperleg_pos, bh_upperlip_pos, diet_after_diner_snack, diet_breakfast_daily, diet_late_dinner, diet_three_meals_daily, date_submitted, exercise_ma_days_pw, exercise_ma_mins_pd, exercise_sitting_hrs_pd, exercise_va_days_pw, exercise_va_mins_pd, exercise_walking_days_pw, exercise_walking_mins_pd, mc_absent_date, mc_age, mc_irregular_start_age, mc_irregular_year_bleeds, mc_present_status, mc_regular_days, pmh_alcohol, pmh_alcohol_week_taken, pmh_bc_diagonsed_age, pmh_blood_clot, pmh_diabetes, pmh_diabetes_diagonosed_age, pmh_earlier_first_pubic_hair, pmh_hbp_diagonosed_age, pmh_hc_diagonosed_age, pmh_hd_diagonosed_age, pmh_heart_disease, pmh_high_blood_pressure, pmh_high_cholesterol, pmh_smoke_day_taken, pmh_smoke_status, pmh_smoke_years, pmh_underactive_thyroid, pmh_ut_diagnosed_age, skin_acne, skin_acne_start_age, sleep_snore, weight_over, weight_overyear, ethnicity, patient_id, synced, local_user_id) VALUES ('\(bhArms)', '\(bhBreast)', '\(bhChin)', '\(bhEscu)', '\(bhLowerBack)', '\(bhPublic)', \(bhUnwant), \(bhStartAge), '\(bhUpperBack)', '\(bhUpperLeg)', '\(bhUpperLip)', '\(dietSnack)', \(dietBreakfast), \(dietLateDinner), \(dietThreeMeals), '\(dateSubmit)', \(exMaDaysPerWeek), \(exMaMinsPerDay), \(exSitHoursPerDay), \(exVaDaysPerWeek), \(exVaMinsPerDay), \(exWalkDaysPerWeek), \(exWalkMinsPerDay), '\(mcAbsentDate)', \(mcAge), \(mcIrregularStart), \(mcIrregularBleeds), '\(mcStatus)', \(mcRegular), \(pmhAlcohol), \(pmhAlcoholWeekTaken), \(pmhBcDiagAge), \(pmhBc), \(pmhDiabetes), \(pmhDiabetesDiagAge), \(pmhEarlyPublicHair), \(pmhHbpDiagAge), \(pmhHcDiagAge), \(pmhHdDiagAge), \(pmhHd), \(pmhHbp), \(pmhHc), \(pmhSmokeTaken), '\(pmhSmokeStatus)', \(pmhSmokeYear), \(pmhUt), \(pmhUtDiagAge), \(skinAcne), \(skinAcneStartAge), '\(sleepSnore)', \(weightOver), \(weightOverYear), '\(ethnicity)', \(patientId), \(sync), \(localId))"
        
        sql = sql.stringByReplacingOccurrencesOfString("nil", withString: "NULL")
        
        if Config.debug { println(sql) }
        
        if let err = SD.executeChange(sql) {
            showAlert("Save questionnaire failed.")
        } else {
            showAlert("Saved questionnaire.")
        }
    }
}
















































