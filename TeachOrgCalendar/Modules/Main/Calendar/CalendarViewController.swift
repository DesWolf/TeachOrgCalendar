//
//  SecondTabViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit

protocol CalendarViewProtocol: AnyObject, NavigatingView {
    var presenter: CalendarPresenterProtocol! { get set }
}

class CalendarViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CalendarPresenterProtocol!
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    @objc private func addTapped() {
        presenter.addEvent()
    }
}

extension CalendarViewController: CalendarViewProtocol {}
