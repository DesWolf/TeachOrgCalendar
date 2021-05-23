//
//  SelfConfigurableViewModel.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 12/29/20.
//

import UIKit

protocol SelfConfigurableViewModel {
    func configure(tableCell: UITableViewCell, at index: IndexPath)
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath)
    func configure(view: UITableViewHeaderFooterView, in section: Int)
    func configure(view: UIView)
}

extension SelfConfigurableViewModel {
    
    func configure(tableCell: UITableViewCell, at index: IndexPath) {}
    func configure(collectionCell: UICollectionViewCell, at index: IndexPath) {}
    func configure(view: UITableViewHeaderFooterView, in section: Int) {}
    func configure(view: UIView) {}
    
}
