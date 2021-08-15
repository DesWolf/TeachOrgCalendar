//
//  DismissingView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit

protocol DismissingView {
    func dismissView(animated: Bool, completion: (() -> Void)?)
}

extension DismissingView where Self: UIViewController {
    
    func dismissView(animated: Bool, completion: (() -> Void)?) {
        dismiss(animated: animated, completion: completion)
    }
    
}
