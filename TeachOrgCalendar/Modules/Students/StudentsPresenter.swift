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
    func loadStudents()
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
    
    private func navigateToStudentProfile(student: Student?) {
        if let newView = try? moduleAssembly.assembledView(for: .studentProfile(student: student)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
}

extension StudentsPresenter: StudentsPresenterProtocol {
    func viewDidLoad() {
        loadStudents()
        databaseNotifier.subscribe(self)
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
//        navigateToStudentProfile(student: tempStudents[index])
    }
    
    func loadStudents() {
        databaseManager.loadListOfStudents()
    }
    
    func addStudent() {
        if let newView = try? moduleAssembly.assembledView(for: .studentProfile(student: nil)) {
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
}
