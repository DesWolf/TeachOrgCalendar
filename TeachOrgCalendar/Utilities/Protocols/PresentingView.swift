//
//  PresentingView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/10/20.
//

import UIKit

protocol PresentingView {
    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func presentWrappingInNavigation(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
}

extension PresentingView where Self: UIViewController {
    func present(viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(viewController, animated: animated, completion: completion)
    }
    
    func presentWrappingInNavigation(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        let navi = UINavigationController(rootViewController: viewController)
        navi.setNavigationBarHidden(true, animated: false)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true, completion: completion)
    }
}
