//
//  EventNoteViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit

struct EventNoteViewModel {
    let cellTextView: String?
    
    weak var delegate: EventNoteTableCellDelegate?
}

extension EventNoteViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditEventNoteTableCell else {
            return
        }
        
        cell.delegate = delegate
        cell.cellTitle.text = Strings.EditEvent.note
        cell.cellTextView.text = cellTextView

    }
}
