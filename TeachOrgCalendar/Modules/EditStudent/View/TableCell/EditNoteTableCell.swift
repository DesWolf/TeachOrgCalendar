//
//  NoteTableCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/4/21.
//

import UIKit
import SnapKit
    
protocol EditNoteCellDelegate: AnyObject {
    func noteTVdidChanged(note: String?)
}

class EditNoteTableCell: UITableViewCell {
    let noteTitle = UILabel()
    let noteTextView = UITextView()
    
    weak var delegate: EditNoteCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditNoteTableCell.reuseIdentifier)
        
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

        noteTextView.delegate = self
        noteTextView.set(text: Strings.EditStudent.notePlaceholder, font: .regularText, color: .lightGray)
        
        
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

extension EditNoteTableCell: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        delegate?.noteTVdidChanged(note: textView.text)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if noteTextView.textColor == .lightGray {
            noteTextView.text = nil
            noteTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if noteTextView.text.isEmpty {
            noteTextView.text = Strings.EditStudent.notePlaceholder
            noteTextView.textColor = .lightGray
        }
    }
}

