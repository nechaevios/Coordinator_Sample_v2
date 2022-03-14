//
//  LoginCoordinator.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 10.03.2022.
//

import UIKit

protocol LoginCoordinatorProtocol: Coordinator {
    func showLogin()
}

class LoginCoordinator : LoginCoordinatorProtocol {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .login

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("LoginCoordinator deallocated")
    }

    func start() {
        showLogin()
    }

    func showLogin() {
        let loginVC = LogInViewController()
        loginVC.viewModel = LogInViewModel()
        loginVC.navigationItem.title = "LogIn"

        loginVC.viewModel.didSendEventClosure = { [weak self] eventType in
            switch eventType {
            case .forgotPassword:
                self?.showResetPassword()
            case .main:
                self?.type = .main
                self?.finish()
            }
        }

        navigationController.pushViewController(loginVC, animated: false)
    }

    private func showResetPassword() {
        let resetVC = PasswordResetViewController()
        resetVC.navigationItem.title = "Reset"
        navigationController.pushViewController(resetVC, animated: true)
    }
}
