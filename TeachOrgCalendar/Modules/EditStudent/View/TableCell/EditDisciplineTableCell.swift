//
//  DisciplineTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

class EditDisciplineTableCell: UITableViewCell {
    let disciplineTitle = UILabel()
    let disciplineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let disciplineDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditDisciplineTableCell.reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func setupViews() {
        backgroundColor = .background
        selectionStyle = .none
        disciplineTitle.set(font: .mediumText, color: .black)
        disciplineDescription.set(font: .smallDescription, color: .black)
        disciplineDescription.numberOfLines = 2
                
        disciplineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: EditDisciplineTableCell.reuseIdentifier)
        disciplineCollectionView.backgroundColor = .background

        contentView.addSubview(disciplineTitle)
        contentView.addSubview(disciplineCollectionView)
        contentView.addSubview(disciplineDescription)
    }
    
    private func setupConstraints() {
        disciplineTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        disciplineCollectionView.snp.makeConstraints {
            $0.top.equalTo(disciplineTitle.snp.bottom).offset(15)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        
        disciplineDescription.snp.makeConstraints {
            $0.top.equalTo(disciplineCollectionView.snp.bottom).offset(7)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}

