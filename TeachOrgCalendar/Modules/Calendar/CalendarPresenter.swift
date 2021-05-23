//
//  SecondTabViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol CalendarPresenterType {
    // MARK: - Input
    var viewController: CalendarViewControllerType! { get set }
    
    // MARK: - Output
}

class CalendarPresenter {
    // MARK: - Input
    
    // MARK: - Output
    
    weak var viewController: CalendarViewControllerType!
    private let moduleAssembly: ModuleAssemblyType
    
    init(moduleAssembly: ModuleAssemblyType) {
        self.moduleAssembly = moduleAssembly
    }
}

extension CalendarPresenter: CalendarPresenterType {}