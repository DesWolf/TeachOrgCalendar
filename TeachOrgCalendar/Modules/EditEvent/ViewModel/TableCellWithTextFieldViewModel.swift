//
//  TableCellWithTextFieldViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit

struct TableCellWithTextFieldViewModel {
    let cellTextField: String?
    let elem: EditEventElemType
    
    weak var delegate: TableCellWithTextDelegate?
}

extension TableCellWithTextFieldViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? TableCellWithTextField else {
            return
        }
        
        cell.delegate = delegate
        cell.cellTextField.text = cellTextField
        cell.rowType = elem
        
        switch elem {
        case .name:
            cell.cellTitle.text = Strings.EditEvent.name
            cell.cellTextField.placeholder = Strings.EditEvent.namePlaceholder
        case .place:
            cell.cellTitle.text = Strings.EditEvent.place
            cell.cellTextField.placeholder = Strings.EditEvent.placePlaceholder
        case .repeatedly:
            cell.cellTitle.text = Strings.EditEvent.repeatLesson
            cell.cellTextField.placeholder = Strings.EditEvent.Repeat.never
        default:
            return
        }
    }
}
