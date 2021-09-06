//
//  SecondTabViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol CalendarPresenterProtocol {
    var view: CalendarViewProtocol! { get set }
    
    func addEvent()
}

class CalendarPresenter {
    
    // MARK: - Public properties
    
    weak var view: CalendarViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly) {
        self.moduleAssembly = moduleAssembly
    }
    
    
}

extension CalendarPresenter: CalendarPresenterProtocol {
    func addEvent() {
        if let newView = try? moduleAssembly.assembledView(for: .editEvent(event: nil)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
}
