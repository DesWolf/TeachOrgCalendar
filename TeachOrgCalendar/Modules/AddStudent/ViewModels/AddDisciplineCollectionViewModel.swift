//
//  AddDisciplineCollectionViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/6/21.
//

import UIKit

struct AddDisciplineCollectionViewModel {
}

extension AddDisciplineCollectionViewModel: SelfConfigurableViewModel {
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath) {
        guard let cell = collectionCell as? AddDisciplineCollectionViewCell else {
            return
        }
        
    }
}
