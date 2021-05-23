//
//  ProfileViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol ProfileViewControllerType: class, PresentingView {
    var presenter: ProfilePresenterType! { get set }
}

class ProfileViewController: UIViewController {
    
    public var presenter: ProfilePresenterType!
    
    override func loadView() {
        let view = ProfileView()
    
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ProfileViewController: ProfileViewControllerType {}