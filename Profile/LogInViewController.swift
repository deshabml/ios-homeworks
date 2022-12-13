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

    lazy var logInButton: UIButton = {
        var logInButton = UIButton(frame: .zero)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .selected)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .highlighted)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel")?.image(alpha: 0.8), for: .disabled)
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(buttonActionLogIn), for: .touchUpInside)
        return logInButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        addSubviews(scrollView, [
            logo,
            stackTextField,
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
            stackTextField.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackTextField.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackTextField.heightAnchor.constraint(equalToConstant: 100),
            logInButton.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 16),
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
        let pvc = ProfileViewController()
        navigationController?.pushViewController(pvc, animated: true)
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

extension UIViewController {

    func autoHideTheKeyboard(_ view: UIView) {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.touch))
        view.addGestureRecognizer(recognizer)
    }

    @objc func touch() {
        self.view.endEditing(true)
    }

}
