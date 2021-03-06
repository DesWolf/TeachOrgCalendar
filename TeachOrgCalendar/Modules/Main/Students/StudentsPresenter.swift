//
//  StudentsPresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import Foundation

protocol StudentsPresenterProtocol: AnyObject {
    var view: StudentsViewProtocol! { get set }
    
    func viewDidLoad()
    func refresh()
    func addStudent()
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func didSelect(at index: Int)
    func deleteStudent(at index: Int)
}

class StudentsPresenter {
    
    // MARK: - Public properties
    
    weak var view: StudentsViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly!
    private let databaseManager: DatabaseManager!
    private let databaseNotifier: DatabaseObserver!
    
    private var students: [Student] = []
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly,
         databaseManager: DatabaseManager,
         databaseNotifier: DatabaseObserver) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        self.databaseNotifier = databaseNotifier
    }
    
    // MARK: - Private methods
    
    private func loadStudents() {
        databaseManager.loadListOfStudents()
    }
}

// MARK: - Public methods

extension StudentsPresenter: StudentsPresenterProtocol {
    func viewDidLoad() {
        loadStudents()
        databaseNotifier.subscribe(self)
    }
    
    func refresh() {
        students.removeAll()
        loadStudents()
    }
    
    func numberOfRows() -> Int {
        return students.count
    }
    
    func model(at index: Int) -> SelfConfigurableViewModel {
        var disciptinesString = ""
        
        students[index].disciplines?.forEach { lesson in
            disciptinesString.append("\(lesson), ")
        }
        
        return StudentCellViewModel(name: students[index].name ?? "",
                                    surname: students[index].surname,
                                    disciplines: disciptinesString)
    }
    
    func didSelect(at index: Int) {
         let student = students[index]
        if let newView = try? moduleAssembly.assembledView(for: .student(student: student)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
    
    func addStudent() {
        if let newView = try? moduleAssembly.assembledView(for: .editStudent(student: nil)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
    
    func deleteStudent(at index: Int) {
        guard let id = students[index].id else {
            return
        }
        databaseManager.deleteStudent(id: id)
    }
}

extension StudentsPresenter: DatabaseNotifier {
    func listOfStudents(list: [Student]) {
        students = list
        DispatchQueue.main.async {
            self.view.reloadTableView()
        }
    }
    
    func listOfEvents(list: [Event]) { }
}
