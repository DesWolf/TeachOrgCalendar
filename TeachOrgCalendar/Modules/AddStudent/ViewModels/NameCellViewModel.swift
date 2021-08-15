//
//  NameCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct NameCellViewModel {
    let nameTextField: String?
    let surnameTextField: String?
    
    weak var delegate: NameCellDelegate?
}

extension NameCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? NameTableCell else {
            return
        }
        
        cell.delegate = delegate
        cell.nameTitle.text = Strings.StudentProfile.nameTitle
        cell.nameTextField.text = nameTextField
        cell.nameTextField.placeholder = Strings.StudentProfile.namePlaceholder
        cell.surnameTextField.text = surnameTextField
        cell.surnameTextField.placeholder = Strings.StudentProfile.surnamePlaceholder
    }
}
