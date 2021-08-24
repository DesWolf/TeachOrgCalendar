//
//  StudentViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit

protocol StudentViewProtocol: AnyObject, DismissingView, NavigatingView, PoppingView {
    var presenter: StudentPresenterProtocol! { get set }
}

class StudentViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: StudentPresenterProtocol!
    
    override func loadView() {
        let view = StudentView()
        
        view.table.delegate = self
        view.table.dataSource = self
        view.table.register(StudentNameTableCell.self, forCellReuseIdentifier: StudentNameTableCell.reuseIdentifier)
        view.table.register(StudentDisciplineTableCell.self, forCellReuseIdentifier: StudentDisciplineTableCell.reuseIdentifier)
        view.table.register(StudentContactsTableCell.self, forCellReuseIdentifier: StudentContactsTableCell.reuseIdentifier)
        view.table.register(StudentNoteTableCell.self, forCellReuseIdentifier: StudentNoteTableCell.reuseIdentifier)
        
        self.view = view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        navigationController?.navigationBar.transparentNavigationBar()
        let editButton = UIBarButtonItem(title: Strings.StudentProfile.edit, style: .done, target: self, action: #selector(editStudent))
        
        let backButton = UIBarButtonItem(title: Strings.StudentProfile.backButton, style: .done, target: self, action: #selector(backToStudents))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = editButton
    }
        
    // MARK: - Private methods
    
    private func setupView() {
    }
    
    @objc private func editStudent() {
        presenter.editStudent()
    }
    
    @objc private func backToStudents() {
        presenter.closeStudent()
    }
}

extension StudentViewController: StudentViewProtocol { }

extension StudentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter.cell(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let nameCellHeight: CGFloat = 200
        let disciplineCellHeight: CGFloat = 130
        let phoneCellHeight: CGFloat = 65
        let emailCellHeight: CGFloat = 65
        let tabBarHeight: CGFloat = self.tabBarController?.tabBar.frame.height ?? 100
        switch indexPath.row {
        case 0:
            return nameCellHeight
        case 1:
            return disciplineCellHeight
        case 2:
            return phoneCellHeight
        case 3:
            return emailCellHeight
        case 4:
            let height = self.view.frame.height - nameCellHeight - disciplineCellHeight - phoneCellHeight - emailCellHeight - tabBarHeight
            return height
        default:
            return UITableView.automaticDimension
        }
    }
}
