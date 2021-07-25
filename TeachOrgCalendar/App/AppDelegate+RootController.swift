//
//  AppDelegate+RootController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

extension AppDelegate {
    
    func setRootController() {
        let container = ApplicationAssembly.assembler.resolver
        guard let moduleAssembly = container.resolve(ModuleAssembly.self) else {
            return
        }
        let rootController: UIViewController? = try? moduleAssembly.assembledView(for: .launch)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = rootController
    }
}


