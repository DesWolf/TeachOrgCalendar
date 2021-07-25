//
//  NotifiersAssembly.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/24/21.
//

import Swinject

struct NotifiersAssembly: Assembly {
    func assemble(container: Container) {
        
        // MARK: - Auth notifier
        container.register(AuthNotifierImpl.self) { r in
            
            AuthNotifierImpl()
        }.inObjectScope(.container)
        container.register(AuthNotifier.self) { r in
            guard let notifier = r.resolve(AuthNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return notifier
        }
        container.register(AuthObserver.self) { r in
            guard let observer = r.resolve(AuthNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return observer
        }
        
        // MARK: - App collapse notifier
        container.register(AppCollapseNotifier.self) { _ in
            AppCollapseNotifier()
        }.inObjectScope(.container)
        container.register(AppCollapseNotifierType.self) { r in
            guard let notifier = r.resolve(AppCollapseNotifier.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return notifier
        }
        container.register(AppCollapseObserverType.self) { r in
            guard let observer = r.resolve(AppCollapseNotifier.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return observer
        }
    }
}
