//
//  StudentInfoTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit
import SnapKit

class TableCellWithStackView: UITableViewCell {
    let stack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditNameTableCell.reuseIdentifier)
    
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
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        contentView.addSubview(stack)
    }
    
    private func setupConstraints() {
        stack.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(15)
        }
    }
}
