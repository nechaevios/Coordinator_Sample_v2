//
//  MainViewController.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 07.03.2022.
//

import UIKit

class MainViewController: UIViewController, UISetupProtocol {

    var viewModel: MainViewModelProtocol! {
        didSet {
            print("main view model did set")
        }
    }

    var user: User?

    private lazy var greetingLabel = createUILabel(with: "Hello! \(user?.name ?? "")", alignment: .center)
    private lazy var logOutButton = createUIButton(withTitle: "Logout", andColor: .systemBlue)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()

    }

    deinit {
        print("MainViewController deallocated")
    }

    @objc private func logOut() {
        viewModel?.logOutPressed()
    }
}

extension MainViewController {

    // MARK: - - Setup UI

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(logOutButton)

        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            logOutButton.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
