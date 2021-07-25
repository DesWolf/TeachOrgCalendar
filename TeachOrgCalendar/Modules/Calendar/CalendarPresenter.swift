//
//  SecondTabViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol CalendarPresenterProtocol {
    var viewController: CalendarViewProtocol! { get set }
}

class CalendarPresenter {
    
    // MARK: - Public properties
    
    weak var viewController: CalendarViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
}

extension CalendarPresenter: CalendarPresenterProtocol {}
