//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import UIKit

protocol EditStudentPresenterProtocol {
    var view: EditStudentViewProtocol! { get set }
    
    func viewDidLoad()
    func cellIdentifier(at index: Int) -> String
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func saveStudent()
    func cancelEdit()
}

class EditStudentPresenter: NSObject {
    
    // MARK: - Public properties
    
    weak var view: EditStudentViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    private let databaseManager: DatabaseManager
    private var student: Student?
    private var rowsLayout: [StudentRow] = []
    private let defaultRowsLayout: [StudentRow] = [
        .name,
        .discipline,
        .phone,
        .email,
        .note
    ]
    
    // MARK: - Initializers
    
    init(moduleAssembly: ModuleAssembly,
         databaseManager: DatabaseManager,
         student: Student?) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        
        guard let student = student else {
            return
        }
        self.student = student
    }
    
    private func navigateToStudentProfile(student: Student) {
        if let newView = try? moduleAssembly.assembledView(for: .student(student: student)) {
            newView.modalPresentationStyle = .fullScreen
            self.view.push(viewController: newView, animated: true)
        }
    }
    
    private func simpleAlert(message: String) {
        UIAlertController.simpleAlert(title:"Error", msg:"\(message)")
    }
}

extension EditStudentPresenter: EditStudentPresenterProtocol {
    func saveStudent() {
        guard let student = student else {
            return
        }
        
        if student.name == nil || student.name == "" {
            simpleAlert(message: Strings.EditStudent.Error.emptyName)
            return
        }

        if student.id == nil {
            let newId = databaseManager.addStudent(student: student)
            self.student?.id = newId
        } else {
            databaseManager.editStudent(student: student)
        }
        
        navigateToStudentProfile(student: student)
    }
    
    func cancelEdit() {
        view.popViewController(animated: true)
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
                return EditNameCellViewModel(nameTextField: student?.name,
                                         surnameTextField: student?.surname,
                                         delegate: self)
            case .discipline:
                return EditDisciplineTableCellViewModel(dataSource: self, delegate: self)
            case .phone:
                return EditContactsCellViewModel(contactsTitle: Strings.StudentProfile.phoneTitle,
                                             icon: #imageLiteral(resourceName: "tel"),
                                             textField: student?.phone,
                                             type: .phone,
                                             delegate: self)
            case .email:
                return EditContactsCellViewModel(contactsTitle: Strings.StudentProfile.emailTitle,
                                             icon: #imageLiteral(resourceName: "email"),
                                             textField: student?.email,
                                             type: .email,
                                             delegate: self)
            case .note:
                return EditNoteCellViewModel(note: student?.note, delegate: self)
        }
    }
}

extension EditStudentPresenter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let disciplines = student?.disciplines else {
            return 1
        }
        
        return disciplines.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == student?.disciplines?.count || student?.disciplines == nil {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddDisciplineCollectionViewCell.reuseIdentifier, for: indexPath)
            let model = AddDisciplineCollectionViewModel()
            model.configure(collectionCell: cell, at: indexPath)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier, for: indexPath)
            
            let model = DisciplineCollectionViewModel(discipline: student?.disciplines?[indexPath.row] ?? "" )
            model.configure(collectionCell: cell, at: indexPath)
            
            return cell
        }
    }
}

// MARK: - Delegates

extension EditStudentPresenter: EditNameCellDelegate {
    func nameTFdidChanged(name: String?) {
        guard let name = name else {
            return
        }
        student?.name = name
    }
    
    func surnameTFdidChanged(surname: String?) {
        guard let surname = surname else {
            return
        }
        student?.surname = surname
    }
}

extension EditStudentPresenter: EditContactCellDelegate {
    func contactTFdidChanged(contact: String?, type: ContactsCellType) {
        
        // MARK: ToDo: Add email and phone validation
        
        guard let contact = contact,
              contact != Strings.EditStudent.emailPlaceholder ||
                contact != Strings.EditStudent.phonePlaceholder else {
            return
        }
        switch type {
            case .email:
                student?.email = contact
            case .phone:
                student?.phone = contact
        }
    }
}

extension EditStudentPresenter: EditNoteCellDelegate {
    func noteTVdidChanged(note: String?) {
        guard let note = note else {
            return
        }
        student?.note = note
    }
}
