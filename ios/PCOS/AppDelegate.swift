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
        self.initializeDb(false)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func initializeDb(force:Bool) -> Bool {
        let documentPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let dbFilePath = documentPath.stringByAppendingString(Config.dbFile)
        let filemanager = NSFileManager.defaultManager()
        
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

