//
//  SecondPageViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol StudentsViewControllerType: class, PresentingView {
    var presenter: StudentsPresenterType! { get set }
}

class StudentsViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: StudentsPresenterType!
    
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
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        guard let view = self.view as? StudentsView else { return }
        
        view.tableView.delegate = self
        view.tableView.dataSource = self
        view.tableView.register(StudentCell.self, forCellReuseIdentifier: StudentCell.reuseIdentifier)
    }
}

extension StudentsViewController: StudentsViewControllerType {}

// MARK: - TableView Delegate, DataSource

extension StudentsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCell.reuseIdentifier, for: indexPath)
        let model = presenter.model(at: indexPath)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return studentCellHeight
    }
}
