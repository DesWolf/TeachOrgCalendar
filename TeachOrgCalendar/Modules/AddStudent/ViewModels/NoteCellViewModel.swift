//
//  NoteCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct NoteCellViewModel {
    let note: String?
    
    weak var delegate: NoteCellDelegate?
}

extension NoteCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? NoteTableCell else {
            return
        }
    
        cell.delegate = delegate
        cell.noteTitle.text = Strings.StudentProfile.noteTitle
        guard let note = note else {
            return
        }
        cell.noteTextView.text = note
        
    }
}
