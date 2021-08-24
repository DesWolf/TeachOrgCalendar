//
//  StudentProfileNameCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit
import SnapKit
    
class StudentNameTableCell: UITableViewCell {
    let nameTitle = UILabel()
    private let avatar = UIImageView()
    
    private let divider = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: StudentNameTableCell.reuseIdentifier)
        
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
        divider.backgroundColor = .divider
       
        
        nameTitle.set(font: .mediumText, color: .black)
        nameTitle.textAlignment = .center
        avatar.image = #imageLiteral(resourceName: "studentLogo")
        avatar.image = avatar.image?.withRenderingMode(.alwaysTemplate)
        avatar.tintColor = .calendarBlue
       
        contentView.addSubview(nameTitle)
        contentView.addSubview(divider)
        contentView.addSubview(avatar)
    }
    
    private func setupConstraints() {
        avatar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        nameTitle.snp.makeConstraints {
            $0.top.equalTo(avatar.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(nameTitle.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}

