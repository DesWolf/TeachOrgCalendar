//
//  EventTableViewCell.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 9/9/21.
//

import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell {
    let startTimeLabel = UILabel()
    let endTimeLabel = UILabel()
    let nameLabel = UILabel()
    let disciplineLabel = UILabel()
    let priceLabel = UILabel()
    let paymentStatusLabel = UILabel()
    let statusView = UIView()
    let background = UIView()
    
    let timeStack = UIStackView()
    let descriptionStack = UIStackView()
    let priceStack = UIStackView()
    let totalStack = UIStackView()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: EditNameTableCell.reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        background.backgroundColor = .background
        background.layer.cornerRadius = 10
        background.layer.borderColor = UIColor.border.cgColor
        background.layer.borderWidth = 0.5
        background.clipsToBounds = true
        
        selectionStyle = .none
        accessoryType = .none
        
        
        statusView.backgroundColor = .purple
        
        startTimeLabel.set(font: .regularText, color: .black)
        endTimeLabel.set(font: .regularText, color: .lightGray)
        nameLabel.set(font: .eventTitle, color: .black)
        disciplineLabel.set(font: .smallDescription, color: .lightGray)
        priceLabel.set(font: .regularText, color: .black)
        paymentStatusLabel.set(font: .smallDescription, color: .black)
        
        let stacks = [timeStack, descriptionStack, priceStack]
        
        for stack in stacks {
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.spacing = 5
        }
        
        totalStack.axis = .horizontal
        totalStack.alignment = .fill
        totalStack.distribution = .fill
        totalStack.spacing = 16
        
        contentView.addSubview(background)
        background.addSubview(statusView)
        background.addSubview(totalStack)
        
        totalStack.addArrangedSubview(timeStack)
        totalStack.addArrangedSubview(descriptionStack)
        totalStack.addArrangedSubview(priceStack)
        
        timeStack.addArrangedSubview(startTimeLabel)
        timeStack.addArrangedSubview(endTimeLabel)
        
        descriptionStack.addArrangedSubview(nameLabel)
        descriptionStack.addArrangedSubview(disciplineLabel)
        
        priceStack.addArrangedSubview(priceLabel)
        priceStack.addArrangedSubview(paymentStatusLabel)
    }
    
    private func setupConstraints() {
        background.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(8)
            $0.top.bottom.equalToSuperview().inset(4)
        }
        
        statusView.snp.makeConstraints {
            $0.top.bottom.left.equalToSuperview()
            $0.width.equalTo(8)
        }
        
        totalStack.snp.makeConstraints {
            $0.left.equalTo(statusView.snp.right).offset(8)
            $0.top.bottom.right.equalToSuperview().inset(8)
        }
        
        priceStack.snp.makeConstraints {
            $0.width.equalTo(83)
        }

        timeStack.snp.makeConstraints {
            $0.width.equalTo(60)
        }
    }
}

