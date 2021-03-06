//
//  AppDelegate.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard
import Firebase
import FirebaseAuthUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var appCollapseNotifier: AppCollapseNotifier?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        Database.database().isPersistenceEnabled = true
        
        setRootController()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options:
                        [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
      
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
        return true
      }
      // other URL handling goes here.
      return false
    }
}

