//
//  EventCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/9/21.
//

import UIKit

struct EventCellViewModel {
    let startTime: TimeInterval
    let endTime: TimeInterval
    let name: String
    let disciplines: String?
    let price: Int
    let paymentStatus: Bool
    
    let timestampDay = 3600.00
}

extension EventCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EventTableViewCell else { return }
        
        cell.startTimeLabel.text = startTime.eventTimeShort()
        
        cell.nameLabel.text = name
        cell.disciplineLabel.text = disciplines
        cell.priceLabel.text = "\(price) руб."
        
        if paymentStatus {
            cell.paymentStatusLabel.text = Strings.Event.paid
            cell.paymentStatusLabel.textColor = .green
        } else {
            cell.paymentStatusLabel.text = Strings.Event.notPaid
            cell.paymentStatusLabel.textColor = .red
        }

        let days = Int(round((endTime - startTime) / timestampDay))

        if days > 0 {
            cell.endTimeLabel.text = "\(endTime.eventTimeShort()) + \(days)"
        } else {
        cell.endTimeLabel.text = "\(endTime.eventTimeShort())"
        }
    }
}
