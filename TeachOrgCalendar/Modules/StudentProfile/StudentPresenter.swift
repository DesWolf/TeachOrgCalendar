//
//  StudentProfilePresenter.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit

protocol StudentPresenterProtocol: AnyObject {
    var view: StudentViewProtocol! { get set }
    
    func viewDidLoad()
    func cellIdentifier(at index: Int) -> String
    func numberOfRows() -> Int
    func cell(at index: Int) -> UITableViewCell
    func editStudent()
    func closeStudent()
}

class StudentPresenter: NSObject {
    
    // MARK: - Public properties
    
    weak var view: StudentViewProtocol!
    
    // MARK: - Private properties
    
    private let moduleAssembly: ModuleAssembly
    private let databaseManager: DatabaseManager
    private var student = Student()
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
         student: Student) {
        self.moduleAssembly = moduleAssembly
        self.databaseManager = databaseManager
        
        self.student = student
    }
}

extension StudentPresenter: StudentPresenterProtocol {
    func editStudent() {
        if let newView = try? moduleAssembly.assembledView(for: .editStudent(student: student)) {
            newView.modalPresentationStyle = .fullScreen
            view.push(viewController: newView, animated: true)
        }
    }
    
    func closeStudent() {
        view.popToRootViewController(animated: true)
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
    
    func cell(at index: Int) -> UITableViewCell {
        let rowType = rowsLayout[index]
        switch rowType {
            case .name:
                let cell =  StudentNameTableCell()
                
                cell.nameTitle.text = "\(student.name ?? "") \(student.surname ?? "")"
                
                return cell
            case .discipline:
                let cell = StudentDisciplineTableCell()

                cell.disciplineTitle.text = Strings.StudentProfile.disciplineTitle
                cell.disciplineCollectionView.delegate = self
                cell.disciplineCollectionView.dataSource = self
                cell.disciplineCollectionView.register(DisciplineCollectionViewCell.self, forCellWithReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier)

                return cell
            case .phone:
                let cell = StudentContactsTableCell()
                
                cell.contactsTitle.text = Strings.StudentProfile.phoneTitle
                cell.contactIcon.image = #imageLiteral(resourceName: "tel")
                cell.contactText.text = student.phone
                
                return cell
            case .email:
                let cell = StudentContactsTableCell()
                
                cell.contactsTitle.text = Strings.StudentProfile.emailTitle
                cell.contactIcon.image = #imageLiteral(resourceName: "email")
                cell.contactText.text = student.email
                
                return cell
            case .note:
                let cell = StudentNoteTableCell()
                
                cell.noteTitle.text =  Strings.StudentProfile.noteTitle
                cell.noteTextView.text = student.note
                
                return cell
        }
    }
}

extension StudentPresenter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let disciplines = student.disciplines else {
            return 0
        }
        
        return disciplines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier, for: indexPath)
        
        let model = DisciplineCollectionViewModel(discipline: student.disciplines?[indexPath.row] ?? "" )
        model.configure(collectionCell: cell, at: indexPath)
        
        return cell
    }
}

