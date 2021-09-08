//
//  DatabaseNotifier.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 8/14/21.
//

import Foundation

protocol DatabaseNotifier: AnyObject {
    func listOfStudents(list: [Student])
    func listOfEvents(list: [Event])
}

protocol DatabaseObserver: AnyObject {
    func subscribe(_ listener: DatabaseNotifier)
    func unsubscribe(_ listener: DatabaseNotifier)
}

struct DatabaseListener {
    weak var listener: DatabaseNotifier?
}

class DatabaseNotifierImpl {
    var observers: [DatabaseListener] = []
    
    private func dropEmpty() {
        observers = observers.filter { $0.listener != nil }
    }
}

extension DatabaseNotifierImpl: DatabaseNotifier {
    func listOfStudents(list: [Student]) {
        observers.forEach( {$0.listener?.listOfStudents(list: list)})
    }
    
    func listOfEvents(list: [Event]) {
        observers.forEach( {$0.listener?.listOfEvents(list: list)})
    }
}

extension DatabaseNotifierImpl: DatabaseObserver {
    func subscribe(_ listener: DatabaseNotifier) {
        dropEmpty()
        observers.append(DatabaseListener(listener: listener))
    }
    
    func unsubscribe(_ listener: DatabaseNotifier) {
        observers.removeAll(where: { $0.listener === listener })
    }
}
