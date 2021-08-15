//
//  StudentProfileViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import UIKit

protocol AddStudentProtocol: AnyObject, DismissingView {
    var presenter: AddStudentPresenterProtocol! { get set }
}

class AddStudentViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: AddStudentPresenterProtocol!
    
    override func loadView() {
        let view = AddStudentView()
        
        view.table.delegate = self
        view.table.dataSource = self
        view.table.register(NameTableCell.self, forCellReuseIdentifier: NameTableCell.reuseIdentifier)
        view.table.register(DisciplineTableCell.self, forCellReuseIdentifier: DisciplineTableCell.reuseIdentifier)
        view.table.register(ContactsTableCell.self, forCellReuseIdentifier: ContactsTableCell.reuseIdentifier)
        view.table.register(NoteTableCell.self, forCellReuseIdentifier: NoteTableCell.reuseIdentifier)
        
        self.view = view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        navigationController?.title = Strings.StudentProfile.newUserTitle
        
        let doneButton = UIBarButtonItem(title: Strings.Common.conformButton, style: .done, target: self, action: #selector(saveStudent))
        navigationItem.rightBarButtonItems = [doneButton]
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
    }
    
    @objc private func saveStudent() {
        presenter.saveStudent()
        
        navigationController?.popViewController(animated: true)
//        dismissView(animated: true, completion: nil)
    }
}

extension AddStudentViewController: AddStudentProtocol { }

extension AddStudentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.cellIdentifier(at: indexPath.row), for: indexPath)
        let model = presenter.model(at: indexPath.row)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let nameCellHeight: CGFloat = 118
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
