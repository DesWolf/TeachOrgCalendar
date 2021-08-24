//
//  AddDisciplineCollectionViewCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/6/21.
//

import UIKit

class AddDisciplineCollectionViewCell: UICollectionViewCell {
    let addImageView = UIImageView()
    
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
        
        contentView.layer.cornerRadius = 15.0
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.calendarGray.cgColor
        contentView.layer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.masksToBounds = true
    
        addImageView.image = #imageLiteral(resourceName: "plus")
        
        contentView.addSubview(addImageView)
    }
    
    private func setupConstraints() {
        
        addImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(15)
        }
    }
}
