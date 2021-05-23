//
//  TabBarAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

//
//class TabBarAssembly: Assembly {
//
//    func assemble(container: Container) {
//
//        container.register(TabBarPresenterType.self) { r in
//            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
//                fatalError("Can't resolve moduleAssemby in Main View Controller")
//            }
//
//            return TabBarPresenter(moduleAssembly: moduleAssembly)
//        }
//
//        container.register(TabBarViewControllerType.self) { r in
//
//            let storyboard = SwinjectStoryboard.create(name: "TabBar", bundle: nil, container: r)
//            let viewController = storyboard.instantiateInitialViewController()
//            guard let view = viewController as? TabBarViewControllerType else {
//                fatalError("Can't resolve tab bar view")
//            }
//            guard let tabBarController = viewController as? TabBarController else {
//                fatalError("View controller does not conform to Tab bar controller protocol")
//            }
//            guard var presenter = r.resolve(TabBarPresenterType.self) else {
//                fatalError("Can't resolve tab bar presenter")
//            }
//            view.presenter = presenter
//            presenter.viewController = view
//            presenter.tabBarController = tabBarController
//            return view
//        }
//    }
//}



private let storyboardName = "TabBar"

class TabBarAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(TabBarViewControllerType.self) { r in
            let storyboard = SwinjectStoryboard.create(name: storyboardName, bundle: nil, container: r)
            let controller = storyboard.instantiateInitialViewController()
            guard let view = controller as? TabBarViewControllerType else {
                fatalError("Tab Bar Controller does not conform to Tab Bar protocol")
            }
            guard let presenter = r.resolve(TabBarPresenterType.self) else {
                fatalError("Can't resolve TabBarViewModel in Tab Bar Controller")
            }
            
            view.presenter = presenter
            
            return view
        }
        
        container.storyboardInitCompleted(TabBarViewController.self) { (r, c) in }
        
        container.register(TabBarPresenterType.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssemblyType.self) else {
                fatalError("Can't resolve moduleAssemby in Main View Controller")
            }
            
            return TabBarPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
