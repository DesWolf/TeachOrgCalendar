//
//  UIAlertController+Ext.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/24/21.
//

import UIKit

extension UIAlertController {
    class func simpleAlert(title:String, msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Strings.Common.okButton, style: .default) {
            (result: UIAlertAction) -> Void in
        })
        
        UIApplication.getTopViewController()?.present(alert, animated: true, completion: nil)
    }
    
    class func paymentAlert(actionHandler: ((_ press: Bool) -> Void)? = nil) {
        let alert = UIAlertController(title: Strings.Alerts.paymentQuestion, message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Strings.Common.disagree,
                                      style: .cancel,
                                      handler: {
                                        (action:UIAlertAction) in
                                        actionHandler?(false)
                                      }))
        
        
        alert.addAction(UIAlertAction(title: Strings.Common.agree,
                                      style: .default,
                                      handler: { (action:UIAlertAction) in
                                        actionHandler?(true)
                                      }))
        
        UIApplication.getTopViewController()?.present(alert, animated: true, completion: nil)
    }
    
//    class func paymentAlertWithAdition(target: UIViewController, actionHandler: ((_ press: Int) -> Void)? = nil) {
//        let alert = UIAlertController(title: "Занятие оплачено?", message: "", preferredStyle: .alert)
//
//
//        alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: {
//            (action:UIAlertAction) in
//            actionHandler?(0)
//        }))
//
//
//        alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { (action:UIAlertAction) in
//            actionHandler?(1)
//        }))
//
//        alert.addAction(UIAlertAction(title: "Подробнее", style: .default, handler: { (action:UIAlertAction) in
//            actionHandler?(2)
//        }))
//        target.present(alert, animated: true, completion: nil)
//    }
//
//    class func addTextAlert(target: UIViewController, title: String, text: String, actionHandler: ((_ text: String?) -> Void)? = nil) {
//        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
//        alert.addTextField(configurationHandler: { textField in
//            textField.placeholder =  text//"Введите название дисциплины"
//        })
//
//        alert.addAction(UIAlertAction(title: "Добавить", style: .default, handler: { (action:UIAlertAction) in
//            guard let textField =  alert.textFields?.first else {
//                actionHandler?(nil)
//                return
//            }
//            actionHandler?(textField.text)
//        }))
//        target.present(alert, animated: true, completion: nil)
//    }
//
//    class func goSettings(title: String, msg: String, target: UIViewController) {
//
//        let alertController = UIAlertController (title: title, message: msg, preferredStyle: .alert)
//
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
//        alertController.addAction(cancelAction)
//        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
//            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
//                return
//            }
//
//            if UIApplication.shared.canOpenURL(settingsUrl) {
//                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
//                    print("Settings opened: \(success)") // Prints true
//                })
//            }
//        }
//        alertController.addAction(settingsAction)
//
//
//        target.present(alertController, animated: true, completion: nil)
//    }
}

