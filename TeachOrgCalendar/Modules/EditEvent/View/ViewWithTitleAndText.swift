//
//  ViewWithTitleAndText.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/26/21.
//

import UIKit
import SnapKit

protocol ViewWithTitleAndTextDelegate: AnyObject {
    func tap(elem: EditEventElemType)
}

class ViewWithTitleAndText: UIView {
    var viewTitle = UILabel()
    var viewText = UILabel()
    var elem = EditEventElemType.student
    
    weak var delegate: ViewWithTitleAndTextDelegate?
    
    private let viewTextBackground = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (tap))
        
        self.addGestureRecognizer(gesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tap() {
        UIView.animate(withDuration: 0.3) {
            self.viewTextBackground.didSelect()
        }
        delegate?.tap(elem: elem)
        UIView.animate(withDuration: 0.3) {
            self.viewTextBackground.didDeselect()
        }
        
    }
    
    private func setupView() {
        viewTextBackground.didDeselect()
        viewTitle.set(font: .regularText, color: .tabItem)
        
        addSubview(viewTitle)
        addSubview(viewTextBackground)
        viewTextBackground.addSubview(viewText)
    }
    
    private func setupConstraints() {
        viewTitle.snp.makeConstraints {
            $0.left.right.top.equalToSuperview()
            $0.height.equalTo(18)
        }
        
        viewTextBackground.snp.makeConstraints {
            $0.top.equalTo(viewTitle.snp.bottom).offset(8)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(45)
            $0.bottom.equalToSuperview().offset(8)
        }
        
        viewText.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.left.right.equalToSuperview().inset(15)
        }
    }
}
