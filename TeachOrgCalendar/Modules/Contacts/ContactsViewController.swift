//
//  SecondPageViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol ContactsViewControllerType: class, PresentingView {
    var presenter: ContactsPresenterType! { get set }
}

class ContactsViewController: UITableViewController {
    
    public var presenter: ContactsPresenterType!
    
    override func loadView() {
        let view = ContactsView()
    
        view.tableView.delegate = self
        view.tableView.dataSource = self
        self.view = view
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension ContactsViewController: ContactsViewControllerType {}

extension ContactsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let student = 
    }
    
    
}
