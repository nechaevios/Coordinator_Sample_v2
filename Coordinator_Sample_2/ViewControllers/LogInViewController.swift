//
//  LogInViewController.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UISetupProtocol {

    private lazy var greetingLabel = createUILabel(with: "user?", alignment: .center)
    private lazy var logInButton = createUIButton(withTitle: "login", andColor: .systemBlue)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
}

extension LogInViewController {

    // MARK: - - Setup UI

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(logInButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
