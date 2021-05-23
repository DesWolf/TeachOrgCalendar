//
//  SecondTabViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol CalendarViewControllerType: class, PresentingView {
    var viewModel: SecondTabViewModelType! { get set }
}

class CalendarViewController: UIViewController {
    
    public var viewModel: SecondTabViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension CalendarViewController: CalendarViewControllerType {}
