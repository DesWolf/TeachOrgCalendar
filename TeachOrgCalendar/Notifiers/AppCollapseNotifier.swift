//
//  AppCollapseNotifier.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/24/21.
//

import Foundation

protocol AppCollapseNotifier: AnyObject {
    func appEnterBackground()
    func appWillEnterForeground()
    func appSendEventInBackground()
}

protocol AppCollapseObserver: AnyObject {
    func subscribe(_ listener: AppCollapseNotifier)
    func unsubscribe(_ listener: AppCollapseNotifier)
}

struct AppCollapseListener {
    weak var listener: AppCollapseNotifier?
}

class AppCollapseNotifierImpl {
    var observers: [AppCollapseListener] = []
    
    private func dropEmpty() {
        observers = observers.filter { $0.listener != nil }
    }
    
}

extension AppCollapseNotifierImpl: AppCollapseNotifier {
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

extension AppCollapseNotifierImpl: AppCollapseObserver {
    func subscribe(_ listener: AppCollapseNotifier) {
        dropEmpty()
        observers.append(AppCollapseListener(listener: listener))
    }
    
    func unsubscribe(_ listener: AppCollapseNotifier) {
        observers.removeAll(where: { $0.listener === listener })
    }
}
