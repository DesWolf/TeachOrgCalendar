//
//  DisciplineCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct DisciplineTableCellViewModel {
    let dataSource: UICollectionViewDataSource
    let delegate: UICollectionViewDelegate
}

extension DisciplineTableCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? DisciplineTableCell else {
            return
        }
        
        cell.disciplineTitle.text = Strings.StudentProfile.disciplineTitle
        cell.disciplineDescription.text = Strings.StudentProfile.disciplineDescription
        cell.disciplineCollectionView.delegate = delegate
        cell.disciplineCollectionView.dataSource = dataSource
        
        cell.disciplineCollectionView.register(DisciplineCollectionViewCell.self, forCellWithReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier)
        cell.disciplineCollectionView.register(AddDisciplineCollectionViewCell.self, forCellWithReuseIdentifier: AddDisciplineCollectionViewCell.reuseIdentifier)
    }
}
