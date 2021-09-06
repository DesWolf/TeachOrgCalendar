//
//  EditEventReminderAndPriceViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/5/21.
//

import UIKit

struct EditEventReminderAndPriceViewModel {
    let reminder: Reminder?
    let price: Int?
    let showPrice: Bool
    
    weak var delegate: EditPriceDelegate?
}

extension EditEventReminderAndPriceViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditEventReminderAndPriceTableCell else {
            return
        }
        
        cell.delegate = delegate
        
        cell.reminderView.viewTitle.text = Strings.EditEvent.reminder
        if let reminder = reminder {
            cell.reminderView.viewText.text = String(describing: reminder)
        } else {
            cell.reminderView.viewText.text = Reminder.none.rawValue
        }
        
        cell.priceTitle.text = Strings.EditEvent.price
        if let price = price {
            cell.priceTextField.text = String(describing: price)
        }
        cell.priceTextField.placeholder = Strings.EditEvent.pricePlaceHolder
        
        cell.priceView.isHidden = !showPrice
    }
}
