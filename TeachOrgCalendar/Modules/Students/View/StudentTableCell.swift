//
//  StudentCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 5/3/21.
//

import UIKit

protocol FilmInfoTableCellDelegate: AnyObject {
    func didTap()
}

class StudentTableCell: UITableViewCell {
    let name = UILabel()
    let surname = UILabel()
    let disciplines = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: StudentTableCell.reuseIdentifier)
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
        
        name.setContentHuggingPriority(.defaultHigh, for:.horizontal)
        surname.setContentHuggingPriority(.defaultLow, for:.horizontal)
        
        contentView.addSubview(name)
        contentView.addSubview(surname)
        contentView.addSubview(disciplines)
    }
    
    private func setupConstraints() {
        name.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(13)
            $0.left.equalTo(self.snp.left).offset(20)
        }
        
        surname.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(13)
            $0.left.equalTo(name.snp.right).offset(10)
            $0.right.equalToSuperview().inset(20)
        }
        
        disciplines.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom)
            $0.right.left.equalToSuperview().inset(20)
        }
    }
}
