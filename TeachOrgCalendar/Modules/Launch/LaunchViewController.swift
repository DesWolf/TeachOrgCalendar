//
//  LaunchViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/25/21.
//

import UIKit

protocol LaunchViewProtocol: AnyObject {
    var presenter: LaunchPresenterProtocol! { get set }
    var authManager: AuthManager! { get set }
    var appCoordinator: AppCoordinatorProtocol! { get set }
}

class LaunchViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: LaunchPresenterProtocol!
    var authManager: AuthManager!
    var appCoordinator: AppCoordinatorProtocol!
    
    override func loadView() {
        let view = LaunchView()

        self.view = view
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        checkAutorization()
    }
    
    // MARK: - Private methods
    
    private func checkAutorization() {
        if authManager.isAuthorized() {
            appCoordinator.navigateToMainScreen()
        } else {
            appCoordinator.navigateToLogin()
        }
    }
}

extension LaunchViewController: LaunchViewProtocol { }

