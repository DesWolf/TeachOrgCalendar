//
//  ContactsTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit
import SnapKit
    
protocol EditContactCellDelegate: AnyObject {
    func contactTFdidChanged(contact: String?, type: ContactsCellType)
}

class EditContactsTableCell: UITableViewCell {
    let contactsTitle = UILabel()
    let contactIcon = UIImageView()
    let contactTextField = UITextField()
    var contactType = ContactsCellType.email
    let stack = UIStackView()
    weak var delegate: EditContactCellDelegate?
    
    private let verticalSeparator = UIView()
    private let divider = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditContactsTableCell.reuseIdentifier)
        
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
        contactsTitle.set(font: .mediumText, color: .black)
        
        verticalSeparator.backgroundColor = .divider
        divider.backgroundColor = .divider
        
        if contactType == .phone {
            contactTextField.keyboardType = .numberPad
        }
        
        contactTextField.addTarget(self, action: #selector(contactTFDidChange), for: .editingChanged)
        
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 5
        
        contactIcon.tintColor = .calendarBlue
        
        stack.addArrangedSubview(contactIcon)
        stack.addArrangedSubview(verticalSeparator)
        stack.addArrangedSubview(contactTextField)
        
        contentView.addSubview(contactsTitle)
        contentView.addSubview(stack)
        contentView.addSubview(divider)
    }
    
    private func setupConstraints() {
        contactsTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        stack.snp.makeConstraints() {
            $0.top.equalTo(contactsTitle.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        contactIcon.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        verticalSeparator.snp.makeConstraints {
            $0.height.equalTo(24)
            $0.width.equalTo(1)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(stack.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    @objc func contactTFDidChange() {
        delegate?.contactTFdidChanged(contact: contactTextField.text, type: contactType)
    }
}

