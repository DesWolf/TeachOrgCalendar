//
//  SecondTabViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol CalendarViewControllerType: class, PresentingView {
    var presenter: CalendarPresenterType! { get set }
}

class CalendarViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CalendarPresenterType!
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CalendarViewController: CalendarViewControllerType {}
