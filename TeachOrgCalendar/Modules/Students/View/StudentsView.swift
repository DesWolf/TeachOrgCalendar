//
//  MainView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import SnapKit
    
final class StudentsView: UIView {

    // MARK: - Private properties

    let table = UITableView()
    let refreshControl = UIRefreshControl()
    
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
        addSubview(table)
        table.addSubview(refreshControl)
    }
    
    
    private func setConstraints() {
        table.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
