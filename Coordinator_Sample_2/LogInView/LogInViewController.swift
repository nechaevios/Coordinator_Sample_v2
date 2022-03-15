//
//  LogInViewController.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UISetupProtocol {

    var viewModel: LogInViewModelProtocol! {
        didSet {
            print("login view model did set")
        }
    }

    private lazy var greetingLabel = createUILabel(with: "user", alignment: .center)
    private lazy var userNameTF = createTextField()
    private lazy var logInButton = createUIButton(withTitle: "login", andColor: .systemBlue)
    private lazy var forgotPasswordButton = createUIButton(withTitle: "forgot password?", andColor: .systemGray)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    deinit {
        print("LogInViewController deallocated")
    }
}

extension LogInViewController {

    // MARK: - - Setup Actions

    @objc func loginButtonPressed() {
        guard let name = userNameTF.text else { return }
        viewModel?.logInPressed(name)
    }

    @objc func forgotPasswordButtonPressed() {
        viewModel?.forgotPasswordPressed()
    }

    // MARK: - - Setup UI

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(userNameTF)
        view.addSubview(logInButton)
        view.addSubview(forgotPasswordButton)

        logInButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            userNameTF.heightAnchor.constraint(equalToConstant: 50),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

extension LogInViewController {
    enum Event {
        case forgotPassword, main
    }
}
