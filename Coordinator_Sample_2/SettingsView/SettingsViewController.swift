//
//  SettingsViewController.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 15.03.2022.
//

import UIKit

class SettingsViewController: UIViewController, UISetupProtocol {

    var viewModel: SettingsViewModelProtocol! {
        didSet {
            print("settings view model did set")
        }
    }

    private lazy var greetingLabel = createUILabel(with: "Settings", alignment: .center)
    private lazy var userNameTF = createTextField()
    private lazy var userAgeTF = createTextField()
    private lazy var applyButton =  createUIButton(withTitle: "Apply", andColor: .systemBlue)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setDisplayedText()
        setupConstraints()

    }

    deinit {
        print("SettingsViewController deallocated")
    }

    @objc private func applyPressed() {
        viewModel?.apply(name: userNameTF.text, age: userAgeTF.text)
    }
}

extension SettingsViewController {

    // MARK: - - Setup UI

    private func setDisplayedText() {
        userNameTF.text = viewModel.user?.name
        userAgeTF.text = viewModel.user?.age
    }

    private func setupUI () {
        view.backgroundColor = .white
        view.addSubview(greetingLabel)
        view.addSubview(userNameTF)
        view.addSubview(userAgeTF)
        view.addSubview(applyButton)

        applyButton.addTarget(self, action: #selector(applyPressed), for: .touchUpInside)
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
            userAgeTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 16),
            userAgeTF.heightAnchor.constraint(equalToConstant: 50),
            userAgeTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userAgeTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            applyButton.topAnchor.constraint(equalTo: userAgeTF.bottomAnchor, constant: 16),
            applyButton.heightAnchor.constraint(equalToConstant: 50),
            applyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            applyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
