//
//  LogInViewModel.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import Foundation

protocol LogInViewModelProtocol: AnyObject {
    var didSendEventClosure: ((LogInViewModel.Event) -> Void)? { get set }
    func changeStatus(completion: () -> Void)
}

class LogInViewModel: LogInViewModelProtocol {

    var didSendEventClosure: ((LogInViewModel.Event) -> Void)?
    var user: User?

    deinit {
        print("LogInViewModel deallocated")
    }

    func changeStatus(completion: () -> Void) {
        var status = UserDefaults.standard.bool(forKey: "status")
        if !status {
            status.toggle()
            UserDefaults.standard.set(status, forKey: "status")
        }
        completion()
    }
}

 extension LogInViewModel {
    enum Event {
        case forgotPassword,main
    }
 }
