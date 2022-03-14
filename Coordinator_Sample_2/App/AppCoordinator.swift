//
//  AuthCoordinator.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    func showLoginFlow()
    func showMainFlow()
}

class AppCoordinator: AppCoordinatorProtocol {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType { .app }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.navigationBar.prefersLargeTitles = true
        let status = UserDefaults.standard.bool(forKey: "status")
        status ? showMainFlow() : showLoginFlow()
    }

    func showLoginFlow() {
        let loginFlowCoordinator = LoginCoordinator(navigationController)
        loginFlowCoordinator.finishDelegate = self
        loginFlowCoordinator.start()
        childCoordinators.append(loginFlowCoordinator)
    }

    func showMainFlow() {
        let mainFlowCoordinator = MainCoordinator(navigationController)
        mainFlowCoordinator.finishDelegate = self
        mainFlowCoordinator.start()
        childCoordinators.append(mainFlowCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .login:
            navigationController.viewControllers.removeAll()
            showLoginFlow()
        case .main:
            navigationController.viewControllers.removeAll()
            showMainFlow()
        default:
            break
        }

    }

}