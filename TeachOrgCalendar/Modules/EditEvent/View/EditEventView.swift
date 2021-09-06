//
//  EditEventView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import UIKit
import SnapKit
    
final class EditEventView: UIView {

    // MARK: - Public properties
    
    let table = UITableView()

    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods

    private func setupViews() {
        backgroundColor = .background
        table.separatorStyle = .none
        
        addSubview(table)
    }
    
    private func setConstraints() {
        table.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
