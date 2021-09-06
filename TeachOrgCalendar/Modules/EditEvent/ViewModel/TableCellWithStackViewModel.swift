//
//  StudentInfoViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit

struct TableCellWithStackViewModel {
    let elements: [EditEventElem]
    weak var delegate: ViewWithTitleAndTextDelegate?
}

extension TableCellWithStackViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? TableCellWithStackView else {
            return
        }

        for elem in elements {
            let view = ViewWithTitleAndText()
            view.viewTitle.text = elem.title
            view.elem = elem.type
            view.delegate = delegate
            
            switch elem.type {
            case .price:
                view.viewText.text = elem.text == nil ? Strings.EditEvent.pricePlaceHolder : elem.text
            case .repeatedly:
                view.viewText.text = elem.text == nil ? Strings.EditEvent.repeatPlaceholder : elem.text
            default:
                view.viewText.text = elem.text
            }
            
            cell.stack.addArrangedSubview(view)
        }
    }
}

