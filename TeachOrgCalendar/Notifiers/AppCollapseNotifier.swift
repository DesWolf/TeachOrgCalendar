//
//  AppCollapseNotifier.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/24/21.
//

import Foundation

protocol AppCollapseNotifierType: AnyObject {
    func appEnterBackground()
    func appWillEnterForeground()
    func appSendEventInBackground()
}

extension AppCollapseNotifierType {
    func appSendEventInBackground() {}
}

typealias AppCollapseListenerType = AppCollapseNotifierType

protocol AppCollapseObserverType: AnyObject {
    func subscribe(_ listener: AppCollapseNotifierType)
    func unsubscribe(_ listener: AppCollapseNotifierType)
}

struct AppCollapseListener {
    weak var listener: AppCollapseListenerType?
}

class AppCollapseNotifier {
    
    var observers: [AppCollapseListener] = []
    
    private func dropEmpty() {
        observers = observers.filter { $0.listener != nil }
    }
    
}

extension AppCollapseNotifier: AppCollapseNotifierType {
    func appEnterBackground() {
        observers.forEach { $0.listener?.appEnterBackground() }
    }
    
    func appWillEnterForeground() {
        observers.forEach { $0.listener?.appWillEnterForeground() }
    }
    
    func appSendEventInBackground() {
        observers.forEach { $0.listener?.appSendEventInBackground() }
    }
}

extension AppCollapseNotifier: AppCollapseObserverType {
    
    func subscribe(_ listener: AppCollapseNotifierType) {
        dropEmpty()
        observers.append(AppCollapseListener(listener: listener))
    }
    
    func unsubscribe(_ listener: AppCollapseNotifierType) {
        observers.removeAll(where: { $0.listener === listener })
    }
}
