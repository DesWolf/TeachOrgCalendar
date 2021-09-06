//
//  EditEventNotificationAndPriceTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/5/21.
//

import UIKit
import SnapKit

protocol EditPriceDelegate: AnyObject {
    func textFieldDidChanged(price: Int?)
}

class EditEventReminderAndPriceTableCell: UITableViewCell {
    let stack = UIStackView()
    let reminderView = ViewWithTitleAndText()
    let priceView = UIView()
    let priceTitle = UILabel()
    let priceTextField = UITextField()
    
    private let backgroundTextFieldView = UIView()
    
    weak var delegate: EditPriceDelegate?
    
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
        backgroundTextFieldView.didDeselect()
        
        priceTitle.set(font: .regularText, color: .tabItem)
        priceTextField.set(font: .regularText, color: .black)
        priceTextField.borderStyle = .none
        
        backgroundTextFieldView.addSubview(priceTextField)
        priceView.addSubview(priceTitle)
        priceView.addSubview(backgroundTextFieldView)
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        priceTextField.keyboardType = .numberPad
        
        stack.addArrangedSubview(reminderView)
        stack.addArrangedSubview(priceView)
        contentView.addSubview(stack)
    }
    
    private func setupConstraints() {
        priceTitle.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        backgroundTextFieldView.snp.makeConstraints {
            $0.top.equalTo(priceTitle.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        priceTextField.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(45)
            $0.left.right.equalToSuperview().inset(15)
        }
        
        stack.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.left.right.equalToSuperview().inset(15)
        }
    }
    
    @objc func cellTFDidChange() {
        delegate?.textFieldDidChanged(price: Int(priceTextField.text ?? "") ?? 0)
    }
}
