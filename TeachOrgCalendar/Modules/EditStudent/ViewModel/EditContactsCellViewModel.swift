//
//  ContactsCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

enum ContactsCellType {
    case phone
    case email
}

struct EditContactsCellViewModel {
    let contactsTitle: String
    let icon: UIImage
    let textField: String?
    let type: ContactsCellType
    
    weak var delegate: EditContactCellDelegate?
}

extension EditContactsCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditContactsTableCell else {
            return
        }
        
        cell.contactsTitle.text = contactsTitle
        cell.contactIcon.image = icon
        cell.contactType = type
        cell.delegate = delegate
        
        switch type {
        case .phone:
            cell.contactsTitle.text = Strings.StudentProfile.phoneTitle
            cell.contactTextField.text = textField
            cell.contactTextField.placeholder = Strings.EditStudent.phonePlaceholder
        case .email:
            cell.contactsTitle.text = Strings.StudentProfile.emailTitle
            cell.contactTextField.text = textField
            cell.contactTextField.placeholder = Strings.StudentProfile.emailTitle
        }
    }
}

