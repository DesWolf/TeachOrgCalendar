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
    
    // MARK: - Private properties
    
    private  let greetingsTitle = UILabel()
    private let greetingsImage = UIImageView()

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
        
        greetingsTitle.numberOfLines = 0
        greetingsTitle.set(font: .title, color: .black)
        greetingsTitle.textAlignment = .center
        greetingsTitle.text = Strings.Login.greetingsTitle
        
        greetingsImage.image = #imageLiteral(resourceName: "greetingsImage")

        signInButton.backgroundColor = .blue
        signInButton.layer.cornerRadius = 10
        signInButton.setTitle(Strings.Login.loginButton, for: .normal)
        
        addSubview(greetingsImage)
        addSubview(greetingsTitle)
        addSubview(signInButton)
    }
    
    private func setConstraints() {
        greetingsImage.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(338)
            $0.height.equalTo(242)
        }
        
        greetingsTitle.snp.makeConstraints {
            $0.bottom.equalTo(greetingsImage.snp.top).offset(-100)
            $0.left.right.equalToSuperview().inset(25)
        }
        
        signInButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(180)
            $0.width.equalTo(200)
            $0.height.equalTo(40)
        }
    }
}
