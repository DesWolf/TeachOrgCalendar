//
//  ContactsTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit
import SnapKit
    
protocol ContactCellDelegate: AnyObject {
    func contactTFdidChanged(contact: String?, type: ContactsCellType)
}

class ContactsTableCell: UITableViewCell {
    let contactsTitle = UILabel()
    let contactIcon = UIImageView()
    let contactTextField = UITextField()
    var contactType = ContactsCellType.email
    weak var delegate: ContactCellDelegate?
    
    private let verticalSeparator = UIView()
    private let divider = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: ContactsTableCell.reuseIdentifier)
        
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
        
        contentView.addSubview(contactsTitle)
        contentView.addSubview(contactIcon)
        contentView.addSubview(verticalSeparator)
        contentView.addSubview(contactTextField)
        contentView.addSubview(divider)
        
    }
    
    private func setupConstraints() {
        contactsTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        contactIcon.snp.makeConstraints {
            $0.top.equalTo(contactsTitle.snp.bottom).offset(5)
            $0.width.equalTo(22)
            $0.height.equalTo(17)
            $0.left.equalToSuperview().offset(20)
        }
        
        verticalSeparator.snp.makeConstraints {
            $0.top.equalTo(contactsTitle.snp.bottom).offset(5)
            $0.height.equalTo(25)
            $0.width.equalTo(1)
            $0.left.equalTo(contactIcon.snp.right).offset(5)
        }
        
        contactTextField.snp.makeConstraints {
            $0.top.equalTo(contactsTitle.snp.bottom).offset(5)
            $0.left.equalTo(verticalSeparator.snp.right).offset(5)
            $0.right.equalToSuperview().inset(20)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(contactTextField.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    @objc func contactTFDidChange() {
        delegate?.contactTFdidChanged(contact: contactTextField.text, type: contactType)
    }
}

