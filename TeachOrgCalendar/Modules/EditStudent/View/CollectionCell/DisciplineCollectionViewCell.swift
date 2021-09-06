//
//  DisciplineCollectionViewCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/6/21.
//

import UIKit

class DisciplineCollectionViewCell: UICollectionViewCell {
    let disciplineTitle = UILabel()
    
    override init(frame:CGRect) {
        super.init(frame: .zero)

        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        layer.cornerRadius = self.frame.height / 4
        backgroundColor = .gray
        contentView.addSubview(disciplineTitle)
       
    }
    
    private func setupConstraints() {
        disciplineTitle.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
