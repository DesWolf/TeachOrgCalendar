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
        
        // MARK: - Database notifier
        container.register(DatabaseNotifierImpl.self) { r in
            DatabaseNotifierImpl()
        }.inObjectScope(.container)
        container.register(DatabaseNotifier.self) { r in
            guard let notifier = r.resolve(DatabaseNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return notifier
        }
        container.register(DatabaseObserver.self) { r in
            guard let observer = r.resolve(DatabaseNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return observer
        }
        
        // MARK: - App collapse notifier
        container.register(AppCollapseNotifierImpl.self) { _ in
            AppCollapseNotifierImpl()
        }.inObjectScope(.container)
        container.register(AppCollapseNotifier.self) { r in
            guard let notifier = r.resolve(AppCollapseNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return notifier
        }
        container.register(AppCollapseObserver.self) { r in
            guard let observer = r.resolve(AppCollapseNotifierImpl.self) else {
                fatalError("Failed to resolve App collapse notifier")
            }
            return observer
        }
    }
}
