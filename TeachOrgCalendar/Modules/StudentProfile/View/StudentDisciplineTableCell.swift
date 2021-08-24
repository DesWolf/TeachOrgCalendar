//
//  StudentDisciplineTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit

class StudentDisciplineTableCell: UITableViewCell {
    let disciplineTitle = UILabel()
    let disciplineCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: StudentDisciplineTableCell.reuseIdentifier)
        
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
                
        disciplineCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: EditDisciplineTableCell.reuseIdentifier)
        disciplineCollectionView.backgroundColor = .purple

        contentView.addSubview(disciplineTitle)
        contentView.addSubview(disciplineCollectionView)
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
    }
}

