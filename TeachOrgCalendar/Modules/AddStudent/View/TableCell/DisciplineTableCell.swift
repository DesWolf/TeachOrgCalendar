//
//  DisciplineTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit

class DisciplineTableCell: UITableViewCell {
    let disciplineTitle = UILabel()
    let disciplineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let disciplineDescription = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DisciplineTableCell.reuseIdentifier)
        
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
        
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 60, height: 20)
                
        disciplineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: DisciplineTableCell.reuseIdentifier)
        disciplineCollectionView.backgroundColor = .purple

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
            $0.height.equalTo(40)
        }
        
        disciplineDescription.snp.makeConstraints {
            $0.top.equalTo(disciplineCollectionView.snp.bottom).offset(7)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}

