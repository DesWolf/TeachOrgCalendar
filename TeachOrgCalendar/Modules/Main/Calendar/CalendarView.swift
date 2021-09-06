//
//  CalendarView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 4/16/21.
//

import UIKit
import SnapKit
    
final class CalendarView: UIView {

    // MARK: - Private properties

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

    // MARK: - Public methods
    
    // MARK: - Private methods

    private func setupViews() {
        
        backgroundColor = .orange
//        addSubview(tableView)
    }
    
    
    private func setConstraints() {
        
//        tableView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
    }
}
