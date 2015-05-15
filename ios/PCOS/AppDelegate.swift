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
        self.registerNotification()
        
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
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        switch (identifier!) {
            // TODO
            case Config.accept:
                println("accept")
            case Config.decline:
                println("decline")
            default:
                println("Error: unexpected notification action identifier!")
        }
        
        completionHandler()
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
    
    func registerNotification() {
        // Actions
        let acceptAction = UIMutableUserNotificationAction()
        acceptAction.identifier = Config.accept
        acceptAction.title = "Accept"
        acceptAction.activationMode = UIUserNotificationActivationMode.Background
        acceptAction.authenticationRequired = false
        acceptAction.destructive = true
        
        let declineAction = UIMutableUserNotificationAction()
        declineAction.identifier = Config.decline
        declineAction.title = "Decline"
        declineAction.activationMode = UIUserNotificationActivationMode.Background
        declineAction.destructive = false
        
        // Category
        let appCategory = UIMutableUserNotificationCategory()
        appCategory.identifier = Config.categoryID
        appCategory.setActions([declineAction, acceptAction], forContext: UIUserNotificationActionContext.Default)
        appCategory.setActions([declineAction, acceptAction], forContext: UIUserNotificationActionContext.Minimal)
        
        let types = UIUserNotificationType.Alert
        let settings = UIUserNotificationSettings(forTypes: types, categories: NSSet(object: appCategory) as Set<NSObject>)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
    }
}

