//
//  PasswordResetViewController.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 08.03.2022.
//

import UIKit

class PasswordResetViewController: UIViewController, UISetupProtocol {

    private lazy var greetingLabel = createUILabel(with: "Reset Password!", alignment: .center)
    private lazy var resetButton = createUIButton(withTitle: "Reset", andColor: .systemBlue)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    deinit {
        print("PasswordResetViewController deallocated")
    }
}

extension PasswordResetViewController {

    // MARK: - - Setup UI

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(resetButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
