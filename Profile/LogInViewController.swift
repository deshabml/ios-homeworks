//
//  LogInViewController.swift
//  Navigation
//
//  Created by Лаборатория on 07.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()

    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField(frame: .zero)
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.placeholder = "Email or phone"
        generalSettingsForTextFild(loginTextField)
        loginTextField.delegate = self
        return loginTextField
    }()

    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: .zero)
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Password"
        generalSettingsForTextFild(passwordTextField)
        passwordTextField.delegate = self
        return passwordTextField
    }()

    private lazy var errorNumberPassword: UILabel = {
        let errorNumberPassword = UILabel()
        errorNumberPassword.text = "Enter a password of at least 8 characters long!"
        errorNumberPassword.font = UIFont(name: "regular", size: 8)
        errorNumberPassword.textColor = .red
        errorNumberPassword.isHidden = true
        errorNumberPassword.translatesAutoresizingMaskIntoConstraints = false
        return errorNumberPassword
    }()

    private var stackTextFieldLeadingAnchor: NSLayoutConstraint!

    private var stackTextFieldTrailingAnchor: NSLayoutConstraint!

    private lazy var stackTextField: UIStackView = {
        let stackTextField = UIStackView()
        stackTextField.axis = .vertical
        stackTextField.distribution = .fillEqually
        stackTextField.spacing = 0
        stackTextField.translatesAutoresizingMaskIntoConstraints = false
        stackTextField.addArrangedSubview(loginTextField)
        stackTextField.addArrangedSubview(passwordTextField)
        stackTextFieldLeadingAnchor = stackTextField.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        stackTextFieldTrailingAnchor = stackTextField.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        return stackTextField
    }()

    lazy var logInButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        if let imageButtonColor = UIImage(named: "blue_pixel") {
            configuration.baseBackgroundColor = UIColor(patternImage: imageButtonColor)
        } else {
            configuration.baseBackgroundColor = .systemBlue
        }
        configuration.title = "Log In"
        configuration.baseForegroundColor = .white
        var logInButton = UIButton(configuration: configuration, primaryAction: nil)
        logInButton.configurationUpdateHandler = { button in
            switch button.state {
                case .selected, .highlighted, .disabled:
                    button.alpha = 0.8
                default:
                    button.alpha = 1
            }
        }
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(buttonActionLogIn), for: .touchUpInside)
        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubviews([
            logo,
            stackTextField,
            errorNumberPassword,
            logInButton
        ])
        installingСonstraints()
        subscriptKeyboardEvents()
        scrollView.keyboardDismissMode = .interactive
        self.autoHideTheKeyboard(scrollView)
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }

}

extension LogInViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100),
            stackTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackTextFieldLeadingAnchor,
            stackTextFieldTrailingAnchor,
            stackTextField.heightAnchor.constraint(equalToConstant: 100),
            errorNumberPassword.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 2),
            errorNumberPassword.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logInButton.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 24),
            logInButton.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
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
        textFild.keyboardType = .asciiCapable
        textFild.translatesAutoresizingMaskIntoConstraints = false
    }

    private func subscriptKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyBoardWillShow(_ notification: NSNotification) {
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - scrollView.safeAreaInsets.bottom + 20, right: 0)
    }

    @objc func keyBoardWillHide(_ notification: NSNotification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }

    @objc func buttonActionLogIn() {
        normalView()
        guard loginTextField.text != "" || passwordTextField.text != "" else {
            emptyField(textFild: loginTextField)
            emptyField(textFild: passwordTextField)
            twitching()
            return
        }
        guard loginTextField.text != "" else {
            emptyField(textFild: loginTextField)
            twitching()
            return
        }
        guard passwordTextField.text != "" else {
            emptyField(textFild: passwordTextField)
            twitching()
            return
        }
        guard let passwordTextField = passwordTextField.text else { return }
        guard passwordTextField.count >= 8 else {
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.emptyField(textFild: self.passwordTextField)
            }) {_ in
                self.errorNumberPassword.isHidden = false
            }
            twitching()
            return
        }
        guard let loginTextField = loginTextField.text else { return }
        normalView()
        if loginTextField != defaultAccount.login {
            let alert = UIAlertController(title: "Warning!", message: "Login is wrong \"\(defaultAccount.login)\"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel ))
            present(alert, animated: true, completion: nil)
        }
        if passwordTextField != defaultAccount.password {
            let alert = UIAlertController(title: "Warning!", message: "Password is wrong \"\(defaultAccount.password)\"", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try again", style: .cancel ))
            present(alert, animated: true, completion: nil)
        }
        let pvc = ProfileViewController()
        navigationController?.pushViewController(pvc, animated: true)
    }

    private func emptyField(textFild: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            textFild.layer.borderWidth = 1
            textFild.layer.borderColor = UIColor.red.cgColor
        })
    }

    private func normalView() {
        UIView.animate(withDuration: 0, delay: 0, animations: {
            self.generalSettingsForTextFild(self.loginTextField)
            self.generalSettingsForTextFild(self.passwordTextField)
            self.errorNumberPassword.isHidden = true
        })
    }

    private func twitching() {
        UIView.animate(withDuration: 0.05,  animations: {
            UIView.modifyAnimations(withRepeatCount: 6, autoreverses: true) {
                self.stackTextFieldLeadingAnchor.constant = 11
                self.stackTextFieldTrailingAnchor.constant = -21
                self.view.layoutIfNeeded()
            }
        }) {_ in
            self.stackTextFieldLeadingAnchor.constant = 16
            self.stackTextFieldTrailingAnchor.constant = -16
        }
    }

    private var defaultAccount: (login: String, password: String) {
        let defaultAccount = (login: "user@mail.ru", password: "Password")
        return defaultAccount
    }

}

extension UIViewController {

    func autoHideTheKeyboard(_ view: UIView) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        view.addGestureRecognizer(recognizer)
    }

    @objc func touch() {
        self.view.endEditing(true)
    }

}
