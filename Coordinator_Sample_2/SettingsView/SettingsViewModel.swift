//
//  SettingsViewModel.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 15.03.2022.
//

import Foundation

protocol SettingsViewModelProtocol {
    var didSendEventClosure: ((SettingsViewModel.Event, String?, String?) -> Void)? { get set }
    var user: User? { get set }
    func apply(name: String?, age: String?)
}

class SettingsViewModel: SettingsViewModelProtocol {

    var didSendEventClosure: ((SettingsViewModel.Event, String?, String?) -> Void)?
    var user: User?

    func apply(name: String?, age: String?) {
        user?.name = name ?? ""
        user?.age = age ?? ""
        didSendEventClosure?(.applySettings, name, age)
    }

    deinit {
        print("SettingsViewModel deallocated")
    }

}

extension SettingsViewModel {
    enum Event {
        case applySettings
    }
}
