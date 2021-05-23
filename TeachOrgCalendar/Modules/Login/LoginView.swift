//
//  LoginView.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 3/28/21.
//

import UIKit
import SnapKit
    
final class LoginView: UIView {

    // MARK: - Public properties
    
    let signInButton = UIButton()

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
        signInButton.backgroundColor = .blue
        signInButton.layer.cornerRadius = 10
        signInButton.setTitle(Strings.Login.loginButton, for: .normal)
        
        addSubview(signInButton)
    }
    
    private func setConstraints() {
        signInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(200)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
}
