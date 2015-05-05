//
//  AppDelegate.swift
//  PCOS
//
//  Created by Xin Huang on 21/04/2015.
//  Copyright (c) 2015 Xin Huang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.initializeDb(Config.reinit)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
    }

    func applicationDidEnterBackground(application: UIApplication) {
    }

    func applicationWillEnterForeground(application: UIApplication) {
    }

    func applicationDidBecomeActive(application: UIApplication) {
    }

    func applicationWillTerminate(application: UIApplication) {
    }
    
    func initializeDb(force:Bool) -> Bool {
        let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let dbFilePath = documentPath.stringByAppendingString(Config.dbFile)
        let filemanager = NSFileManager.defaultManager()
        if Config.debug { println(dbFilePath) }
        
        if (!filemanager.fileExistsAtPath(dbFilePath) || force) {
            let initDbPath = NSBundle.mainBundle().resourcePath?.stringByAppendingString(Config.dbFile)
            
            if (initDbPath == nil) {
                return false
            } else {
                var error: NSError?
                if force { filemanager.removeItemAtPath(dbFilePath, error: &error) }
                let copySuccessful = filemanager.copyItemAtPath(initDbPath!, toPath:dbFilePath, error: &error)
                if !copySuccessful {
                    NSLog("init db failed: \(error?.localizedDescription)")
                    return false
                }
            }
        }
        return true
    }
}

