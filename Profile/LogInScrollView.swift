//
//  LogInScrollView.swift
//  Navigation
//
//  Created by Лаборатория on 07.12.2022.
//

import UIKit

class LogInScrollView: UIScrollView {

    private lazy var logo: UIView = {
        let logo = UIView(frame: .zero)
        logo.translatesAutoresizingMaskIntoConstraints = false
        let myLayer = CALayer()
        let myImage = UIImage(named: "logo")?.cgImage
        myLayer.frame = CGRect(x: 0,
                               y: 0,
                               width: 100,
                               height: 100)
        myLayer.contents = myImage
        logo.layer.addSublayer(myLayer)
        return logo
    }()

    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField(frame: .zero)
        loginTextField.backgroundColor = .systemGray6
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.borderWidth = 0.5
        loginTextField.layer.borderColor = UIColor.lightGray.cgColor
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.font = UIFont(name: "sistemFont", size: 16)
        loginTextField.textColor = .black
//        statusTextField.tintColor = UIColor.accentColor
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        loginTextField.placeholder = "Email or phone"
//        statusTextField.addTarget(self,
//                                  action: #selector(statusTextChanged),
//                                  for: .editingChanged)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.font = UIFont(name: "regular", size: 16)
        passwordTextField.textColor = .black
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
//        statusTextField.addTarget(self,
//                                  action: #selector(statusTextChanged),
//                                  for: .editingChanged)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false

        return passwordTextField
    }()

    private lazy var stackTextField: UIStackView = {
        let stackTextField = UIStackView()
        stackTextField.axis = .vertical
        stackTextField.distribution = .fillEqually
        stackTextField.spacing = 0
        stackTextField.translatesAutoresizingMaskIntoConstraints = false
        stackTextField.addArrangedSubview(loginTextField)
        stackTextField.addArrangedSubview(passwordTextField)

        return stackTextField
    }()

    override func layoutSubviews() {
        addSubviews([
            logo,
            stackTextField
        ])
        installingСonstraints()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

}

extension LogInScrollView {

    private func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            addSubview($0)
        }
    }

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            stackTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

