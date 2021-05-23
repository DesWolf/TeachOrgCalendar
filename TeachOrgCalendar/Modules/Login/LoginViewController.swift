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
    var presenter: LoginPresenterType!
    var userManager: UserManagerType!
//    var moduleAssembly: ModuleAssemblyType!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = LoginView()
        

        view.signInButton.addTarget(self, action: #selector(loginButtondidTap), for: .touchUpInside)
        self.view = view
        setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    
    private func setupView() {
        
    }
    
    @objc private func loginButtondidTap() {
        userManager.navigateToMainScreen()
    }
}

extension LoginViewController: LoginViewControllerType { }
