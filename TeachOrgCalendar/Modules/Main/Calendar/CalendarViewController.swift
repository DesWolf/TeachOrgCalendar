//
//  SecondTabViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import CVCalendar

protocol CalendarViewProtocol: AnyObject, NavigatingView {
    var presenter: CalendarPresenterProtocol! { get set }
    
    func reloadTableView()
    func reloadRow(at indexpath: IndexPath)
    func reloadCalendar()
}

class CalendarViewController: UIViewController {
    
    // MARK: - Public properties
    
    public var presenter: CalendarPresenterProtocol!
    
    @IBOutlet weak var calendarBackgroundView: UIView!
    @IBOutlet weak var menuView: CVCalendarMenuView!
    @IBOutlet weak var calendarView: CVCalendarView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventsTable: UITableView!
    
    // MARK: - Private properties

    let eventCellHeight: CGFloat = 80
    
    // MARK: - Public methods
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuView.commitMenuViewUpdate()
        calendarView.commitCalendarViewUpdate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        let calendarMode = UIBarButtonItem(image: #imageLiteral(resourceName: "switchView"), style: .plain, target: self, action: #selector(changeCalendarMode))
        
        navigationItem.rightBarButtonItems = [add, calendarMode]
    
        setupView()
    }
    
    @objc private func addTapped() {
        presenter.addEvent()
    }
    
    @objc private func changeCalendarMode() {
        let nextMode = calendarView.calendarMode == .monthView ? CalendarMode.weekView : .monthView
        
        calendarView.changeMode(nextMode)
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        navigationItem.title = Date().month
        
        setupCalendarView()
        setupTableView()
    }
    
    private func setupTableView() {
        eventsTable.delegate = self
        eventsTable.dataSource = self
        
        eventsTable.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reuseIdentifier)
    }
    
    private func setupCalendarView() {
        calendarBackgroundView.backgroundColor = .background
        calendarBackgroundView.layer.cornerRadius = 10
        calendarBackgroundView.layer.borderColor = UIColor.border.cgColor
        calendarBackgroundView.layer.borderWidth = 0.5
        
        menuView.menuViewDelegate = self
        calendarView.calendarAppearanceDelegate = self
        calendarView.animatorDelegate = self
        calendarView.calendarDelegate = self
    }
}

extension CalendarViewController: CalendarViewProtocol {
    func reloadCalendar() {
        calendarView.contentController.refreshPresentedMonth()
    }

    func reloadTableView() {
        eventsTable.reloadData()
    }

    func reloadRow(at indexPath: IndexPath) {
        eventsTable.reloadRows(at: [indexPath], with: .automatic)
    }
}
