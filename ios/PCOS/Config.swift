//
//  Config.swift
//  PCOS
//
//  Created by Xin Huang on 3/05/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

struct Config {
    static let debug = true
    static let reinit = false
    
    static let host = "http://127.0.0.1:5000"
    static let loginUrl = host + "/check"
    static let syncUrl = host + "/api/questionnaire"
    static let appUrl = host + "/api/appointment"
    static let dbFile = "/pcos.db"
    
    static let firstNameKey = "USER_FIRST_NAME"
    static let lastNameKey = "USER_LAST_NAME"
    static let emailKey = "USER_EMAIL"
    static let dobKey = "USER_DATE_OF_BIRTH"
    static let remotePatientID = "REMOTE_PATIENT_ID"
    static let localPatientID = "LOCAL_PATIENT_ID"
    
    static let accept = "APP_ACCEPT"
    static let decline = "APP_DECLINE"
    static let categoryID = "APP_CATEGORY"
}

