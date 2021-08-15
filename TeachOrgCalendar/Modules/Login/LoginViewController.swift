//
//  ViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import GoogleSignIn

protocol LoginViewProtocol: AnyObject {
    var presenter: LoginPresenterProtocol! { get set }
    var appCoordinator: AppCoordinatorProtocol! { get set }
    var authManager: AuthManager! { get set }
    var authNotifier: AuthObserver! { get set }
}

class LoginViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: LoginPresenterProtocol!
    var appCoordinator: AppCoordinatorProtocol!
    var authManager: AuthManager!
    var authNotifier: AuthObserver!
    
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
        
        authNotifier.subscribe(self)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        
    }
    
    @objc private func loginButtondidTap() {
        authManager.signIn(viewController: self)
    }
}

extension LoginViewController: LoginViewProtocol { }

extension LoginViewController: AuthNotifier {
    func sinInComplete(result: Bool) {
        if result {
            appCoordinator.navigateToMainScreen()
        } else {
            print("SignIn Faild")
        }
    }
}
