//
//  NameTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit
import SnapKit
    
protocol NameCellDelegate: AnyObject {
    func nameTFdidChanged(name: String?)
    func surnameTFdidChanged(surname: String?)
}

class NameTableCell: UITableViewCell {
    let nameTitle = UILabel()
    let nameTextField = UITextField()
    let surnameTextField = UITextField()
    weak var delegate: NameCellDelegate?
    
    private let divider = UIView()
    private let secondDivider = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: NameTableCell.reuseIdentifier)
        
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
        secondDivider.backgroundColor = .divider
        
        nameTitle.set(font: .mediumText, color: .black)
        
        nameTextField.addTarget(self, action: #selector(nameTFDidChange), for: .editingChanged)
        surnameTextField.addTarget(self, action: #selector(surnameTFDidChange), for: .editingChanged)
        
        contentView.addSubview(nameTitle)
        contentView.addSubview(nameTextField)
        contentView.addSubview(divider)
        contentView.addSubview(surnameTextField)
        contentView.addSubview(secondDivider)
    }
    
    private func setupConstraints() {
        nameTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameTitle.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        surnameTextField.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(20)
        }
        
        secondDivider.snp.makeConstraints {
            $0.top.equalTo(surnameTextField.snp.bottom).offset(5)
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    @objc func nameTFDidChange() {
        delegate?.nameTFdidChanged(name: nameTextField.text)
    }
    
    @objc func surnameTFDidChange() {
        delegate?.surnameTFdidChanged(surname: surnameTextField.text)
    }
}

