//
//  PoppingView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/22/20.
//

import UIKit

protocol PoppingView {
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
}

extension PoppingView where Self: UIViewController {
    
    func popViewController(animated: Bool) {
        guard let navi = navigationController else { return }
        navi.popViewController(animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        guard let navi = navigationController else { return }
        navi.popToRootViewController(animated: true)
    }
}
