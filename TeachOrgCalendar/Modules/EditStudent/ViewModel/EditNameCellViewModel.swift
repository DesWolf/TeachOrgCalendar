//
//  NameCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct EditNameCellViewModel {
    let nameTextField: String?
    let surnameTextField: String?
    
    weak var delegate: EditNameCellDelegate?
}

extension EditNameCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditNameTableCell else {
            return
        }
        
        cell.delegate = delegate
        cell.nameTitle.text = Strings.EditStudent.nameTitle
        cell.nameTextField.text = nameTextField
        cell.nameTextField.placeholder = Strings.StudentProfile.namePlaceholder
        cell.surnameTextField.text = surnameTextField
        cell.surnameTextField.placeholder = Strings.StudentProfile.surnamePlaceholder
    }
}
