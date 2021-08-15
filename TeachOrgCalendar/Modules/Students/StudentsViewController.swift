//
//  SecondPageViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import FirebaseDatabase

protocol StudentsViewProtocol: AnyObject, PresentingView, NavigatingView{
    var presenter: StudentsPresenterProtocol! { get set }
    var appCoordinator: AppCoordinatorProtocol! { get set }
    
    func reloadTableView()
}

class StudentsViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: StudentsPresenterProtocol!
    var appCoordinator: AppCoordinatorProtocol!
    
    // MARK: - Private properties
    
    private let studentCellHeight: CGFloat = 60
    
    // MARK: - Public methods
    
    override func loadView() {
        let view = StudentsView()

        self.view = view

        setupTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    // MARK: - Private methods
    
    @objc private func addTapped() {
        presenter.addStudent()
    }
    
    private func setupTableView() {
        guard let view = self.view as? StudentsView else {
            return
        }
        
        view.table.delegate = self
        view.table.dataSource = self
        view.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        view.table.register(StudentTableCell.self, forCellReuseIdentifier: StudentTableCell.reuseIdentifier)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        guard let view = self.view as? StudentsView else {
            return
        }
        
        presenter.loadStudents()
        view.refreshControl.endRefreshing()
    }
}

extension StudentsViewController: StudentsViewProtocol {
    func reloadTableView() {
        guard let view = self.view as? StudentsView else {
            return
        }
        view.table.reloadData()
    }
}

// MARK: - TableView Delegate, DataSource

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentTableCell.reuseIdentifier, for: indexPath)
        let model = presenter.model(at: indexPath.row)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return studentCellHeight
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteStudent(at: indexPath.row)
        }
    }
}
