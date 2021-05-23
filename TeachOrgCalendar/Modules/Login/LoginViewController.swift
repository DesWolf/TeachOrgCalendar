//
//  ViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol LoginViewControllerType: class {
    var presenter: LoginPresenterType! { get set }
    var userManager: UserManagerType! { get set }
}

class LoginViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: LoginPresenterType!
    var userManager: UserManagerType!
    
    override func loadView() {
        let view = LoginView()

        view.signInButton.addTarget(self, action: #selector(loginButtondidTap), for: .touchUpInside)
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
    
    @objc private func loginButtondidTap() {
        userManager.navigateToMainScreen()
    }
}

extension LoginViewController: LoginViewControllerType { }
