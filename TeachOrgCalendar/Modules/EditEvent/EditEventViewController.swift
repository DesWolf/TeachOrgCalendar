//
//  EditEventViewController.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import UIKit

protocol EditEventViewProtocol: AnyObject, NavigatingView, PoppingView {
    var presenter: EditEventPresenterProtocol! { get set }
    
    func reloadNoteCell()
}

class EditEventViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: EditEventPresenterProtocol!
    var eventView: UIView!
    
    // MARK: - Private properties
    
    private let eventSegmentControl = UISegmentedControl(items: [Strings.EditEvent.Segment.lesson,
                                                                 Strings.EditEvent.Segment.personal])
    
    override func loadView() {
        let view = EditEventView()
        
        view.table.delegate = self
        view.table.dataSource = self
        view.table.register(TableCellWithTextField.self, forCellReuseIdentifier: TableCellWithTextField.reuseIdentifier)
        view.table.register(TableCellWithStackView.self, forCellReuseIdentifier: TableCellWithStackView.reuseIdentifier)
        view.table.register(EditEventReminderAndPriceTableCell.self, forCellReuseIdentifier: EditEventReminderAndPriceTableCell.reuseIdentifier)
        view.table.register(EditEventNoteTableCell.self, forCellReuseIdentifier: EditEventNoteTableCell.reuseIdentifier)
        
        self.view = view
        eventView = self.view
        setupView()
    }
    
    // MARK: - Public methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        
        eventSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        eventSegmentControl.selectedSegmentIndex = 0
        eventSegmentControl.sendActions(for: .valueChanged)
        
        navigationItem.titleView = eventSegmentControl
        
        
        let doneButton = UIBarButtonItem(title: Strings.Common.conformButton, style: .done, target: self, action: #selector(saveStudent))
        let cancelButton = UIBarButtonItem(title: Strings.Common.cancelButton, style: .done, target: self, action: #selector(cancelEdit))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    // MARK: - Private methods
    
    private func setupView() {
    }
    
    @objc private func saveStudent() {
        presenter.saveEvent()
    }
    
    @objc private func cancelEdit() {
        presenter.cancelEdit()
    }
    
    @objc private func segmentChanged() {
        switchEvent(at: eventSegmentControl.selectedSegmentIndex)
    }
    
    private func rowAnimation(indexPath: IndexPath) {
        guard let view = self.view as? EditEventView else {
            return
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            view.table.beginUpdates()
//            view.table.reloadRows(at: [indexPath], with: .automatic)
            view.table.deselectRow(at: indexPath as IndexPath, animated: true)
            view.table.endUpdates()
        })
    }
}

extension EditEventViewController: EditEventViewProtocol {
    func switchEvent(at: Int) {
        guard let view = self.view as? EditEventView else {
            return
        }
        let studentInfoIndex = presenter.atIndex(type: .studentInfo)
        let priceIndex = presenter.atIndex(type: .reminderAndPrice)
        
        if at == 0 {
            view.table.cellForRow(at: studentInfoIndex)?.isHidden = false
            presenter.showPrice = true
            view.table.reloadRows(at: [priceIndex], with: .automatic)
            
        } else {
            view.table.cellForRow(at: studentInfoIndex)?.isHidden = true
            presenter.showPrice = false
            view.table.reloadRows(at: [priceIndex], with: .automatic)
        }
//        rowAnimation(indexPath: studentInfoIndex)
    }
    
    func reloadCell(atIndex: IndexPath) {
        guard let view = self.view as? EditEventView else {
            return
        }
//
    UIView.animate(withDuration: 0.3, animations: { () -> Void in
        view.table.beginUpdates()
        view.table.deselectRow(at: atIndex as IndexPath, animated: true)
        view.table.endUpdates()
    })
//        view.table.reloadRows(at: [atIndex], with: .automatic)
    }
    
    func reloadNoteCell() {
        guard let view = self.view as? EditEventView else {
            return
        }
        
        UIView.setAnimationsEnabled(false)
        view.table.beginUpdates()
        view.table.endUpdates()
        UIView.setAnimationsEnabled(true)

        let indexPath = presenter.atIndex(type: .note)
        view.table.scrollToRow(at: indexPath, at: .bottom, animated: false)
    }
}

extension EditEventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: presenter.cellIdentifier(at: indexPath.row), for: indexPath)
        let model = presenter.model(at: indexPath.row)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let view = self.view as? EditEventView else {
            return UITableView.automaticDimension
        }
        
        if presenter.row(at: indexPath.row) == .studentInfo &&
            view.table.cellForRow(at: indexPath)?.isHidden == true {
            return 0
        }
        
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
