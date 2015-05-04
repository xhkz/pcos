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
    
    @IBAction func saveLocally(sender: AnyObject) {
        let mcAge: Int? = mcAgeText.text.toInt()
        var bleedStatus: String = ""
        if let select = mcRadio.selectedButton() {
            bleedStatus = select.currentTitle!
        }
        
        let mcRegular: Int? = mcRegularText.text.toInt()
        let mcIrregularBleeds: Int? = mcIrregularBleedsText.text.toInt()
        let mcIrregularStart: Int? = mcIrregularStartText.text.toInt()
        let mcAbsentYear: Int? = mcAbsentYearText.text.toInt()
        let mcAbsentMonth: Int? = mcAbsentMonthText.text.toInt()
    }
}






