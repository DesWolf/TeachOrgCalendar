//
//  DisciplineCollectionViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/6/21.
//

import UIKit

struct DisciplineCollectionViewModel {
    let discipline: String
}

extension DisciplineCollectionViewModel: SelfConfigurableViewModel {
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath) {
        guard let cell = collectionCell as? DisciplineCollectionViewCell else {
            return
        }
        
        cell.disciplineTitle.text = discipline
    }
}
