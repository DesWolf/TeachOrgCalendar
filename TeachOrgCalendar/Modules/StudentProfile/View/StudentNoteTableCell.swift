//
//  StudentNoteTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/15/21.
//

import UIKit
import SnapKit

class StudentNoteTableCell: UITableViewCell {
    let noteTitle = UILabel()
    let noteTextView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: StudentNoteTableCell.reuseIdentifier)
        
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
        noteTitle.set(font: .mediumText, color: .black)

        noteTextView.set(font: .regularText, color: .black)
        
        
        contentView.addSubview(noteTitle)
        contentView.addSubview(noteTextView)
    }
    
    private func setupConstraints() {
        noteTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(20)
        }
        
        noteTextView.snp.makeConstraints {
            $0.top.equalTo(noteTitle.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
}
