//
//  DisciplineCellViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

struct EditDisciplineTableCellViewModel {
    let dataSource: UICollectionViewDataSource
    let delegate: UICollectionViewDelegate
}

extension EditDisciplineTableCellViewModel: SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath) {
        guard let cell = tableCell as? EditDisciplineTableCell else {
            return
        }
        
        cell.disciplineTitle.text = Strings.StudentProfile.disciplineTitle
        cell.disciplineDescription.text = Strings.EditStudent.disciplineDescription
        cell.disciplineCollectionView.delegate = delegate
        cell.disciplineCollectionView.dataSource = dataSource
        
        cell.disciplineCollectionView.register(DisciplineCollectionViewCell.self, forCellWithReuseIdentifier: DisciplineCollectionViewCell.reuseIdentifier)
        cell.disciplineCollectionView.register(AddDisciplineCollectionViewCell.self, forCellWithReuseIdentifier: AddDisciplineCollectionViewCell.reuseIdentifier)
    }
}
