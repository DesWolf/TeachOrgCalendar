//
//  AppDelegate+RootController.swift
//  MVVM+C
//
//  Created by Максим Окунеев on 12/9/20.
//

import UIKit
import Swinject
import SwinjectStoryboard

extension AppDelegate {

        func setRootController() {
            let container = ApplicationAssembly.assembler.resolver
            guard let moduleAssembly = container.resolve(ModuleAssemblyType.self) else {
                return
            }
            let rootController: UIViewController? = try? moduleAssembly.assembledView(for: .login)
            
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
            window?.rootViewController = rootController
        }
}
    
 
