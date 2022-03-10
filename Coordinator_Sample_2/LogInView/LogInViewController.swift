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
        viewModel?.changeStatus {
            viewModel?.didSendEventClosure?(.main)
        }
    }

    @objc func forgotPasswordButtonPressed() {
        viewModel?.didSendEventClosure?(.forgotPassword)
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
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            userNameTF.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            userNameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userNameTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
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
