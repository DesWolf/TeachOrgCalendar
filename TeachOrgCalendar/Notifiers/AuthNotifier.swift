//
//  AuthNotifier.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/24/21.
//

import Foundation

protocol AuthNotifier: AnyObject {
    func sinInComplete(result: Bool)
}

extension AuthNotifier {
    func appSendEventInBackground() {}
}

typealias AuthListenerType = AuthNotifier

protocol AuthObserver: AnyObject {
    func subscribe(_ listener: AuthNotifier)
    func unsubscribe(_ listener: AuthNotifier)
}

struct AuthListener {
    weak var listener: AuthListenerType?
}

class AuthNotifierImpl {
    var observers: [AuthListener] = []
    
    private func dropEmpty() {
        observers = observers.filter { $0.listener != nil }
    }
}

extension AuthNotifierImpl: AuthNotifier {
    func sinInComplete(result: Bool) {
        observers.forEach( {$0.listener?.sinInComplete(result: result)})
    }
}

extension AuthNotifierImpl: AuthObserver {
    
    func subscribe(_ listener: AuthNotifier) {
        dropEmpty()
        observers.append(AuthListener(listener: listener))
    }
    
    func unsubscribe(_ listener: AuthNotifier) {
        observers.removeAll(where: { $0.listener === listener })
    }
}
