//
//  SecondTabViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol CalendarViewProtocol: AnyObject, PresentingView {
    var presenter: CalendarPresenterProtocol! { get set }
}

class CalendarViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CalendarPresenterProtocol!
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CalendarViewController: CalendarViewProtocol {}
