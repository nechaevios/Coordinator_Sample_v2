//
//  MainCoordinator.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 10.03.2022.
//

import UIKit

protocol MainCoordinatorProtocol: Coordinator {
    var user: User? { get set }
    func showMain()
}

class MainCoordinator: MainCoordinatorProtocol {

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
        mainVC.viewModel = MainViewModel()
        mainVC.viewModel.user = user
        mainVC.navigationItem.title = "Main"

        mainVC.viewModel?.didSendEventClosure = { [weak self] eventType in
            switch eventType {
            case .logOut:
                self?.type = .login
                self?.finish()
            }
        }

        navigationController.pushViewController(mainVC, animated: false)
    }

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    deinit {
        print("MainCoordinator deallocated")
    }
}
