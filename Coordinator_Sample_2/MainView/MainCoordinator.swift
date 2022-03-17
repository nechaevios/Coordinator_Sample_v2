//
//  MainCoordinator.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 10.03.2022.
//

import UIKit

protocol MainCoordinatorProtocol: Coordinator {
    func showMain()
}

class MainCoordinator: MainCoordinatorProtocol, updatableDataProtocol {

    weak var finishDelegate: CoordinatorFinishDelegate?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    var type: CoordinatorType = .main
    var user: User?

    func start() {
        showMain()
    }

    func showMain() {
        let mainVC = MainViewController()
        let viewModel = MainViewModel()
        mainVC.viewModel = viewModel
        mainVC.viewModel.user = user
        mainVC.navigationItem.title = "Main"

        mainVC.viewModel?.didSendEventClosure = { [weak self, weak mainVC] eventType in
            switch eventType {
            case .logOut:
                self?.type = .login
                self?.finish()
            case .openSettings:
                self?.showSettings({
                    mainVC?.viewModel?.user = self?.user
                })
            case .showTabs:
                self?.type = .login
                self?.finish()
            }
        }

        navigationController.pushViewController(mainVC, animated: false)
    }

    private func showSettings(_ completion: @escaping () -> Void) {
        let viewController = SettingsViewController()
        viewController.viewModel = SettingsViewModel()
        viewController.viewModel.user = user
        viewController.viewModel?.didSendEventClosure = { [weak self] eventType, name, age in
            switch eventType {
            case .applySettings:
                self?.finishDelegate?.updateUserData(name: name, age: age)
                completion()
                self?.navigationController.popViewController(animated: true)
            }
        }

        navigationController.pushViewController(viewController, animated: true)
    }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("MainCoordinator deallocated")
    }
}
