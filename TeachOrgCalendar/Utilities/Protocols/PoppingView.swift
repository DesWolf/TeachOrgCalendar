//
//  PoppingView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/22/20.
//

import UIKit

protocol PoppingView {
    @discardableResult
    func popViewController(animated: Bool) -> Bool
}

extension PoppingView where Self: UIViewController {
    
    @discardableResult
    func popViewController(animated: Bool) -> Bool {
        guard let navi = navigationController else { return false }
        navi.popViewController(animated: animated)
        return true
    }
}
