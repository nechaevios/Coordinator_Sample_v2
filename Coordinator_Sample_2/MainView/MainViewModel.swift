//
//  MainViewModel.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var didSendEventClosure: ((MainViewModel.Event) -> Void)? { get set }
    var user: User? { get set }
    func logOutPressed()
}

class MainViewModel: MainViewModelProtocol {

    var didSendEventClosure: ((MainViewModel.Event) -> Void)?
    var user: User?

    deinit {
        print("MainViewModel deallocated")
    }

    func logOutPressed() {
        changeStatus()
        didSendEventClosure?(.logOut)
    }

    private func changeStatus() {
        var status = UserDefaults.standard.bool(forKey: "status")
        if status {
            status.toggle()
            UserDefaults.standard.set(status, forKey: "status")
        }
    }

}

extension MainViewModel {
    enum Event {
        case logOut
    }
}
