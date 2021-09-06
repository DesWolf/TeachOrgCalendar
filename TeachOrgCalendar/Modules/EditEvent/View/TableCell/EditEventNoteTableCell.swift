//
//  EventNoteTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/25/21.
//

import UIKit
import SnapKit

protocol EventNoteTableCellDelegate: AnyObject {
    func textViewDidChanged(text: String?, newSize: CGSize)
}

class EditEventNoteTableCell: UITableViewCell {

    let cellTitle = UILabel()
    let cellTextView = UITextView()
    var rowType = EditEventElemType.name
    
    weak var delegate: EventNoteTableCellDelegate?

    private let backgroundTextFieldView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditEventNoteTableCell.reuseIdentifier)
        
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
        cellTextView.delegate = self
        cellTextView.backgroundColor = .clear
        cellTextView.isEditable = true
        cellTextView.isSelectable = true
        cellTextView.isScrollEnabled = false

        cellTextView.set(font: .regularText, color: .black)
        
        contentView.addSubview(cellTitle)
        contentView.addSubview(backgroundTextFieldView)
        backgroundTextFieldView.addSubview(cellTextView)
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
//            $0.height.equalTo(150)
        }
        
        cellTextView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(15)
        }
    }
}

extension EditEventNoteTableCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
            let size = cellTextView.bounds.size
            let newSize = cellTextView.sizeThatFits(CGSize(width: size.width, height: .greatestFiniteMagnitude))

        delegate?.textViewDidChanged(text: cellTextView.text, newSize: newSize)
    }
}

