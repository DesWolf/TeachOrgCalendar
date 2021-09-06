//
//  TableCellWithTextField.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit
import SnapKit

protocol TableCellWithTextDelegate: AnyObject {
    func textFieldDidChanged(elem: EditEventElemType, text: String?)
}

class TableCellWithTextField: UITableViewCell {

    let cellTitle = UILabel()
    let cellTextField = UITextField()
    var rowType = EditEventElemType.name
    
    weak var delegate: TableCellWithTextDelegate?

    private let backgroundTextFieldView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableCellWithTextField.reuseIdentifier)
        
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
        
        cellTitle.set(font: .regularText, color: .tabItem)
        cellTextField.set(font: .regularText, color: .black)
        
        cellTextField.addTarget(self, action: #selector(cellTFDidChange), for: .editingChanged)
       
        contentView.addSubview(cellTitle)
        contentView.addSubview(backgroundTextFieldView)
        backgroundTextFieldView.addSubview(cellTextField)
       
    }
    
    private func setupConstraints() {
        cellTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.right.equalToSuperview().inset(15)
        }
        
        backgroundTextFieldView.snp.makeConstraints {
            $0.top.equalTo(cellTitle.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(15)
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(45)
        }
        
        cellTextField.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
        }
    }
    
    @objc func cellTFDidChange() {
        delegate?.textFieldDidChanged(elem: rowType, text: cellTextField.text)
    }
}
