//
//  UISetupProtocol.swift
//  Coordinator_Sample_2
//
//  Created by Nechaev Sergey  on 07.03.2022.
//

import UIKit

protocol UISetupProtocol {
    func createUIButton(withTitle: String, andColor: UIColor) -> UIButton
    func createUILabel(with string: String, color: UIColor, alignment: NSTextAlignment) -> UILabel
}

extension UISetupProtocol {

    func createUIButton(withTitle: String, andColor: UIColor) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(withTitle, for: .normal)
        button.backgroundColor = andColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0

        return button
    }

    func createUILabel(with string: String, color: UIColor = .black, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = string
        label.textColor = color
        label.textAlignment = alignment
        return label
    }

    func createTextField() -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8.0
        return textField
    }
}
