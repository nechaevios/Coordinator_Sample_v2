//
//  LogInViewModel.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import Foundation

protocol LogInViewModelProtocol: AnyObject {
    var didSendEventClosure: ((LogInViewModel.Event, String?) -> Void)? { get set }
    func logInPressed(_ name: String)
    func forgotPasswordPressed()
    func signUpPressed()
}

class LogInViewModel: LogInViewModelProtocol {

    var didSendEventClosure: ((LogInViewModel.Event, String?) -> Void)?

    deinit {
        print("LogInViewModel deallocated")
    }

    func logInPressed(_ name: String) {
        changeStatus()
        didSendEventClosure?(.main, name)
    }

    func forgotPasswordPressed() {
        didSendEventClosure?(.forgotPassword, nil)
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
