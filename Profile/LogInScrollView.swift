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
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.placeholder = "Email or phone"
        generalSettingsForTextFild(loginTextField)
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        generalSettingsForTextFild(passwordTextField)
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

    private lazy var logInButton: UIButton = {
        var logInButton = UIButton(frame: .zero)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .selected)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .highlighted)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .disabled)
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()

    override func layoutSubviews() {
        addSubviews([
            logo,
            stackTextField,
            logInButton
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
            stackTextField.heightAnchor.constraint(equalToConstant: 100),
            logInButton.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func generalSettingsForTextFild(_ textFild: UITextField) {
        textFild.backgroundColor = .systemGray6
        textFild.layer.cornerRadius = 10
        textFild.layer.borderWidth = 0.5
        textFild.layer.borderColor = UIColor.lightGray.cgColor
        textFild.font = UIFont.systemFont(ofSize: 16)
        textFild.textColor = .black
        textFild.tintColor = UIColor(named: "ColorSet")
        textFild.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFild.frame.height))
        textFild.leftViewMode = .always
        textFild.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImage {
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
