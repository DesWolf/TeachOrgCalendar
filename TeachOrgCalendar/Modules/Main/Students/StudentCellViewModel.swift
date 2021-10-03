//
//  StudentCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/3/21.
//

import UIKit

struct StudentCellViewModel {
    let name: String
    let surname: String?
    let disciplines: String?
}

extension StudentCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? StudentTableCell else { return }
        
        cell.accessoryType = .disclosureIndicator
        
        cell.name.text = name
        cell.surname.text = surname
        cell.disciplines.text = disciplines
    }
}
