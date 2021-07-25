//
//  TabBarAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import Swinject
import SwinjectStoryboard

private let storyboardName = "TabBar"

class TabBarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabBarViewProtocol.self) { r in
            let storyboard = SwinjectStoryboard.create(name: storyboardName, bundle: nil, container: r)
            let controller = storyboard.instantiateInitialViewController()
            
            guard let view = controller as? TabBarViewProtocol else {
                fatalError("Tab Bar Controller does not conform to Tab Bar protocol")
            }
            guard let presenter = r.resolve(TabBarPresenterProtocol.self) else {
                fatalError("Can't resolve TabBarViewModel in Tab Bar Controller")
            }
            
            view.presenter = presenter
            return view
        }
        
        container.storyboardInitCompleted(TabBarViewController.self) { (r, c) in }
        
        container.register(TabBarPresenterProtocol.self) { r in
            guard let moduleAssembly = r.resolve(ModuleAssembly.self) else {
                fatalError("Can't resolve moduleAssemby in Main View Controller")
            }
            
            return TabBarPresenter(moduleAssembly: moduleAssembly)
        }
    }
}
