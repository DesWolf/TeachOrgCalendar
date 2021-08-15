//
//  AuthManager.swift
//  TeachOrgCalendar
//
//  Created by Максим Окунеев on 7/24/21.
//

import Foundation
import FirebaseAuthUI
import FirebaseOAuthUI
import FirebaseEmailAuthUI
import FirebaseGoogleAuthUI
//import FirebaseUI

protocol AuthManager {
    var userUID: String { get }
    
    func isAuthorized() -> Bool
    func signIn(viewController: UIViewController)
    func signOut()
}

final class AuthManagerImpl: NSObject {
    private let authUI = FUIAuth.defaultAuthUI()
    private let emailAuth = FUIEmailAuth()
//    private let googleAuth = FUIGoogleAuth()
    private let appleAuth = FUIOAuth.appleAuthProvider()
    
    private let authNotifier: AuthNotifier

    init(authNotifier: AuthNotifier) {
        self.authNotifier = authNotifier
        super.init()
        
        configure()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        authUI?.tosurl = Configuration.termsOfServiceURL
        authUI?.privacyPolicyURL = Configuration.privacyPolisyURL
        authUI?.shouldHideCancelButton = true
        authUI?.delegate = self
        
        
        
        let providers: [FUIAuthProvider] = [emailAuth,
//                                            googleAuth,
                                            appleAuth]
        authUI?.providers = providers
    }
}

extension AuthManagerImpl: AuthManager {
    var userUID: String {
        get {
            if let user = Auth.auth().currentUser {
                return user.uid
            } else {
                return ""
            }
        }
    }
    
    func isAuthorized() -> Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    
    func signIn(viewController: UIViewController) {
        
        let authViewController = authUI!.authViewController()
        authViewController.modalPresentationStyle = .overCurrentContext
        viewController.present(authViewController, animated: true, completion: nil)
    }
    
    func signOut() {
        do {
         try authUI?.signOut()
        } catch {
            print("Logaut faild")
        }
    }
}

extension AuthManagerImpl: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if (user != nil) {
            authNotifier.sinInComplete(result: true)
        } else {
            authNotifier.sinInComplete(result: false)
        }
    }
}
