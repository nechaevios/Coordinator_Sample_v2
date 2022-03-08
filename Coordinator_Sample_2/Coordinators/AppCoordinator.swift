//
//  AuthCoordinator.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import UIKit

class AppCoordinator: Coordinator {

    enum Destination {
        case logInComplete(user: User)
        case logIn
        case registration
        case resetPassword
    }

    private weak var navigationController: UINavigationController?

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: false)
    }

    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .logIn:
            return LogInViewController()
        case .logInComplete(let user):
            let mainVC = MainViewController()
            mainVC.user = user
            return mainVC
        case .registration:
            return SignUpViewController()
        case .resetPassword:
            return PasswordResetViewController()
        }
    }

}
