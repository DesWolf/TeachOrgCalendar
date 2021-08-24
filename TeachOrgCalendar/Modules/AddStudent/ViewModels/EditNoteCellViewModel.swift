//
//  NoteCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct EditNoteCellViewModel {
    let note: String?
    
    weak var delegate: EditNoteCellDelegate?
}

extension EditNoteCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditNoteTableCell else {
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
