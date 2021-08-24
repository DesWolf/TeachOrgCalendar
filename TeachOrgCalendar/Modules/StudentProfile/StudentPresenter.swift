//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit

protocol StudentPresenterProtocol {
    var view: StudentProtocol! { get set }
    
    func viewDidLoad()
    func cellIdentifier(at index: Int) -> String
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func editStudent()
}



class StudentPresenter: NSObject {
    
    // MARK: - Public properties
    
    weak var view: StudentProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    private let databaseManager: DatabaseManager
    private var student = Student()
    private var rowsLayout: [AddStudentRow] = []
    private let defaultRowsLayout: [AddStudentRow] = [
        .name,
        .discipline,
        .phone,
        .email,
        .note
    ]
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly,
         databaseManager: DatabaseManager,
         studentId: String) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        
        student = databaseManager.student(id: studentId)
    }
}

extension StudentPresenter: StudentPresenterProtocol {
    func editStudent() {
        if let newView = try? moduleAssembly.assembledView(for: .addOrEditStudent(studentId: student.id)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
    
    func viewDidLoad() {
        rowsLayout = defaultRowsLayout
    }
    
    func numberOfRows() -> Int {
        return rowsLayout.count
    }
    
    func cellIdentifier(at index: Int) -> String {
        rowsLayout[index].cellIdentifier
    }
    
    func model(at index: Int) -> SelfConfigurableViewModel {
        let rowType = rowsLayout[index]
        switch rowType {
            case .name:
                return EditNameCellViewModel(nameTextField: student.name,
                                         surnameTextField: student.surname,
                                         delegate: self)
            case .discipline:
                return EditDisciplineTableCellViewModel(dataSource: self, delegate: self)
            case .phone:
                return EditContactsCellViewModel(contactsTitle: Strings.AddOrEditStudent.phoneTitle,
                                             icon: #imageLiteral(resourceName: "Telephone"),
                                             textField: student.phone,
                                             type: .phone,
                                             delegate: self)
            case .email:
                return EditContactsCellViewModel(contactsTitle: Strings.AddOrEditStudent.emailTitle,
                                             icon: #imageLiteral(resourceName: "Mail"),
                                             textField: student.email,
                                             type: .email,
                                             delegate: self)
            case .note:
                return EditNoteCellViewModel(note: student.note, delegate: self)
        }
    }
}

extension StudentPresenter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let disciplines = student.disciplines else {
            return 1
        }
        
        return disciplines.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == student.disciplines?.count || student.disciplines == nil {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddDisciplineCollectionViewCell.reuseIdentifier, for: indexPath)
            let model = AddDisciplineCollectionViewModel()
            model.configure(collectionCell: cell, at: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier, for: indexPath)
            
            let model = DisciplineCollectionViewModel(discipline: student.disciplines?[indexPath.row] ?? "" )
            model.configure(collectionCell: cell, at: indexPath)
            
            return cell
        }
    }
}
