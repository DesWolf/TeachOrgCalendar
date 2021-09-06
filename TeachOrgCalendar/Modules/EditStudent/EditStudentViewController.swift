//
//  StudentProfileViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import UIKit

protocol EditStudentViewProtocol: AnyObject, NavigatingView, PoppingView {
    var presenter: EditStudentPresenterProtocol! { get set }
}

class EditStudentViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: EditStudentPresenterProtocol!
    
    override func loadView() {
        let view = EditStudentView()
        
        view.table.delegate = self
        view.table.dataSource = self
        view.table.register(EditNameTableCell.self, forCellReuseIdentifier: EditNameTableCell.reuseIdentifier)
        view.table.register(EditDisciplineTableCell.self, forCellReuseIdentifier: EditDisciplineTableCell.reuseIdentifier)
        view.table.register(EditContactsTableCell.self, forCellReuseIdentifier: EditContactsTableCell.reuseIdentifier)
        view.table.register(EditNoteTableCell.self, forCellReuseIdentifier: EditNoteTableCell.reuseIdentifier)
        
        self.view = view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
//        navigationController?.navigationBar.transparentNavigationBar()
        self.title = Strings.EditStudent.newUserTitle
        
        let doneButton = UIBarButtonItem(title: Strings.Common.conformButton, style: .done, target: self, action: #selector(saveStudent))
        let cancelButton = UIBarButtonItem(title: Strings.Common.cancelButton, style: .done, target: self, action: #selector(cancelEdit))
        
        navigationItem.leftBarButtonItem?.tintColor = .calendarBlue
        navigationItem.rightBarButtonItem?.tintColor = .calendarBlue
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    }
    
    @objc private func saveStudent() {
        presenter.saveStudent()
    }
    
    @objc private func cancelEdit() {
        presenter.cancelEdit()
    }
}

extension EditStudentViewController: EditStudentViewProtocol { }

extension EditStudentViewController: UITableViewDelegate, UITableViewDataSource {
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
