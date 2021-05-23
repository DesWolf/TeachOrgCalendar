//
//  SecondTabViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol CalendarPresenterType {
    var viewController: CalendarViewControllerType! { get set }
}

class CalendarPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: CalendarViewControllerType!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssemblyType
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension CalendarPresenter: CalendarPresenterType {}
