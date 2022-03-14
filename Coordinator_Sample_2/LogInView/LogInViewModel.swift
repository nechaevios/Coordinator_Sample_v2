//
//  LogInViewModel.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import Foundation

protocol LogInViewModelProtocol: AnyObject {
    var didSendEventClosure: ((LogInViewModel.Event) -> Void)? { get set }
    func logInPressed()
    func forgotPasswordPressed()
    func signUpPressed()
}

class LogInViewModel: LogInViewModelProtocol {

    var didSendEventClosure: ((LogInViewModel.Event) -> Void)?
    var user: User?

    deinit {
        print("LogInViewModel deallocated")
    }

    func logInPressed() {
        changeStatus()
        didSendEventClosure?(.main)
    }

    func forgotPasswordPressed() {
        didSendEventClosure?(.forgotPassword)
    }

    func signUpPressed() {

    }

    private func changeStatus() {
        var status = UserDefaults.standard.bool(forKey: "status")
        if !status {
            status.toggle()
            UserDefaults.standard.set(status, forKey: "status")
        }
    }
}

 extension LogInViewModel {
    enum Event {
        case forgotPassword, main
    }
 }
