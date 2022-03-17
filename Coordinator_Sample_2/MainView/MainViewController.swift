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
            greetingLabel.text = "Hello! \nName: \(viewModel.user?.name ?? "") \nAge: \(viewModel.user?.age ?? "")"
        }
    }

    private lazy var greetingLabel = createUILabel(with: "Hello! \(viewModel.user?.name ?? "")", alignment: .center)
    private lazy var settingsButton =  createUIButton(withTitle: "Settings", andColor: .systemBlue)
    private lazy var tabsButton = createUIButton(withTitle: "Show Tabs", andColor: .systemCyan)
    private lazy var logOutButton = createUIButton(withTitle: "Logout", andColor: .systemGray)

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

    @objc private func settingsButtonPressed() {
        viewModel?.openSettingsView()
    }

    @objc private func showTabsButtonPressed() {
        viewModel?.openTabsView()
    }
}

extension MainViewController {

    // MARK: - - Setup UI

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(settingsButton)
        view.addSubview(tabsButton)
        view.addSubview(logOutButton)

        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        tabsButton.addTarget(self, action: #selector(showTabsButtonPressed), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            settingsButton.bottomAnchor.constraint(equalTo: tabsButton.topAnchor, constant: -16),
            settingsButton.heightAnchor.constraint(equalToConstant: 50),
            settingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            tabsButton.bottomAnchor.constraint(equalTo: logOutButton.topAnchor, constant: -16),
            tabsButton.heightAnchor.constraint(equalToConstant: 50),
            tabsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tabsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            logOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            logOutButton.heightAnchor.constraint(equalToConstant: 50),
            logOutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
