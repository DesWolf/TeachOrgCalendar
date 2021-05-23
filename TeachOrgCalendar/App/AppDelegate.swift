//
//  AppDelegate.swift
//  MVVM+C
//
//  Created by Максим Окунеев on 12/8/20.
//

import UIKit
import Swinject
import SwinjectStoryboard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//    var window: UIWindow?
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//        Container.loggingFunction = nil
//
//        setRootController()
//    return true
//}
//}

    var window: UIWindow?
    let applicationCoordinator = ApplicationCoordinator()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        applicationCoordinator.start()
        return true
      }
}
