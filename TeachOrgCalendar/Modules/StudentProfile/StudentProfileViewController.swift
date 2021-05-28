//
//  StudentProfileViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/24/21.
//

import UIKit

protocol StudentProfileViewControllerType: class {
    var presenter: StudentProfilePresenterType! { get set }
}

class StudentProfileViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: StudentProfilePresenterType!
    
    override func loadView() {
        let view = LoginView()

        self.view = view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    }
    
}

extension StudentProfileViewController: StudentProfileViewControllerType { }
