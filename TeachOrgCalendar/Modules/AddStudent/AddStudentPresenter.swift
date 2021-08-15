//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import UIKit

protocol AddStudentPresenterProtocol {
    var view: AddStudentProtocol! { get set }
    
    func viewDidLoad()
    func cellIdentifier(at index: Int) -> String
    func numberOfRows() -> Int
    func model(at index: Int) -> SelfConfigurableViewModel
    func saveStudent()
}



class AddStudentPresenter: NSObject {
    
    // MARK: - Public properties
    
    weak var view: AddStudentProtocol!
    
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
         student: Student?) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        
        guard let student = student else {
            return
        }
        self.student = student
    }
}

extension AddStudentPresenter: AddStudentPresenterProtocol {
    func saveStudent() {
        databaseManager.addStudent(student: student)
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
                return NameCellViewModel(nameTextField: student.name,
                                         surnameTextField: student.surname,
                                         delegate: self)
            case .discipline:
                return DisciplineTableCellViewModel(dataSource: self, delegate: self)
            case .phone:
                return ContactsCellViewModel(contactsTitle: Strings.StudentProfile.phoneTitle,
                                             icon: #imageLiteral(resourceName: "Telephone"),
                                             textField: student.phone,
                                             type: .phone,
                                             delegate: self)
            case .email:
                return ContactsCellViewModel(contactsTitle: Strings.StudentProfile.emailTitle,
                                             icon: #imageLiteral(resourceName: "Mail"),
                                             textField: student.email,
                                             type: .email,
                                             delegate: self)
            case .note:
                return NoteCellViewModel(note: student.note, delegate: self)
        }
    }
}

extension AddStudentPresenter: UICollectionViewDelegate, UICollectionViewDataSource {
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

// MARK: - Delegates

extension AddStudentPresenter: NameCellDelegate {
    func nameTFdidChanged(name: String?) {
        guard let name = name else {
            return
        }
        student.name = name
    }
    
    func surnameTFdidChanged(surname: String?) {
        guard let surname = surname else {
            return
        }
        student.surname = surname
    }
}

extension AddStudentPresenter: ContactCellDelegate {
    func contactTFdidChanged(contact: String?, type: ContactsCellType) {
        guard let contact = contact,
              contact != Strings.StudentProfile.emailPlaceholder ||
                contact != Strings.StudentProfile.phonePlaceholder else {
            return
        }
        switch type {
            case .email:
                student.email = contact
            case .phone:
                student.phone = contact
        }
    }
}

extension AddStudentPresenter: NoteCellDelegate {
    func noteTVdidChanged(note: String?) {
        guard let note = note else {
            return
        }
        student.note = note
    }
}
