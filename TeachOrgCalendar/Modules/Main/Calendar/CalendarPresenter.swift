//
//  SecondTabViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol CalendarPresenterProtocol {
    var view: CalendarViewProtocol! { get set }
    
    func viewDidLoad()
    func refresh()
    func addEvent()
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func didSelect(at index: Int)
    func deleteEvent(at index: IndexPath)
    func paymentAlert(at index: IndexPath)
    func filterList(date: TimeInterval)
    func hasEvents(date: TimeInterval) -> Bool
}

enum EventType: String {
    case lesson = "Урок"
    case personal = "Личное"
}

enum ModeView {
    case monthView
    case weekView
}

class CalendarPresenter {
    
    // MARK: - Public properties
    
    weak var view: CalendarViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    private let databaseManager: DatabaseManager!
    private let databaseNotifier: DatabaseObserver!
    
    private var events: [Event] = []
    private var filtredEvents: [Event] = []
    private let dayInSeconds: TimeInterval = 86400.0
    private var selectedDate: TimeInterval = Date().startOfDay.timeIntervalSince1970
    private var isFirstLoad = true
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly,
         databaseManager: DatabaseManager,
         databaseNotifier: DatabaseObserver) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        self.databaseNotifier = databaseNotifier
    }
    
    private func loadEvents() {
        databaseManager.loadListOfEvents()
    }
}

extension CalendarPresenter: CalendarPresenterProtocol {
    func numberOfRows() -> Int {
        filtredEvents.count
    }
    
    func model(at index: Int) -> SelfConfigurableViewModel {
        EventCellViewModel(startTime: filtredEvents[index].startDate,
                                  endTime: filtredEvents[index].endDate,
                                  name: filtredEvents[index].name,
                                  disciplines: filtredEvents[index].discipline ?? "",
                                  price: filtredEvents[index].price ?? 0,
                                  paymentStatus: filtredEvents[index].paymentStatus ?? false)
    }

    func filterList(date: TimeInterval) {
        selectedDate = date
        filtredEvents.removeAll()
        filtredEvents = events.filter { $0.dates.contains(date) }
        refresh()
    }

    func hasEvents(date: TimeInterval) -> Bool {
        let dayEvents = events.filter { $0.dates.contains(date) }
        print(date)
        print(dayEvents.count > 0 ? true : false)
        return dayEvents.count > 0 ? true : false
    }
    
    func viewDidLoad() {
        loadEvents()
        databaseNotifier.subscribe(self)
    }
    
    func refresh() {
        events.removeAll()
        loadEvents()
    }
    
    func didSelect(at index: Int) {
        print("select: ", events[index].name)
    }
    
    func addEvent() {
        if let newView = try? moduleAssembly.assembledView(for: .editEvent(event: nil)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
    
    func deleteEvent(at index: IndexPath) {
        guard let id = events[index.row].id else {
            return
        }
        databaseManager.deleteEvent(id: id)
        
        DispatchQueue.main.async {
            self.view.reloadRow(at: index)
        }
        
    }
    
    func paymentAlert(at index: IndexPath) {
        UIAlertController.paymentAlert { result in
            if result {
                
                DispatchQueue.main.async {
                    self.view.reloadRow(at: index)
                }
            }
        }
    }
}

extension CalendarPresenter: DatabaseNotifier {
    func listOfStudents(list: [Student]) {}
    
    func listOfEvents(list: [Event]) {
        events = list
        filtredEvents.removeAll()
        filtredEvents = events.filter { $0.dates.contains(selectedDate) }

        DispatchQueue.main.async {
            self.view.reloadTableView()
            self.view.reloadCalendar()
        }
    }
}
