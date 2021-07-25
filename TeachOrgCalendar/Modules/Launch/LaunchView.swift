//
//  LaunchView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/25/21.
//

import UIKit
import SnapKit
    
final class LaunchView: UIView {

    // MARK: - Public properties
    
    let greetingsImage = UIImageView()

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
        backgroundColor = .white
        greetingsImage.image = #imageLiteral(resourceName: "greetingsImage")
        
        addSubview(greetingsImage)
    }
    
    private func setConstraints() {
        greetingsImage.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(338)
            $0.height.equalTo(242)
        }
    }
}
