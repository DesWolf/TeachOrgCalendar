//
//  CalendarViewController+TableDelegate.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/23/21.
//

import UIKit

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseIdentifier, for: indexPath)
        let model = presenter.model(at: indexPath.row)
        model.configure(tableCell: cell, at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        eventCellHeight
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(
            style: .destructive,
            title: Strings.Common.delete
        ) {  (_, _, _) in
            self.presenter.deleteEvent(at: indexPath)
        }

        let edit = UIContextualAction(
            style: .normal,
            title: Strings.Common.currency
        ) {  (_, _, _) in
            self.presenter.paymentAlert(at: indexPath)
        }

        edit.backgroundColor = .calendarGreen

        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}
