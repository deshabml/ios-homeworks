//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лаборатория on 11.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    static let id = "ProfileHeaderView"

    private lazy var statusText: String = "Waiting for something..."

    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel(frame: .zero)
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        return fullNameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel(frame: .zero)
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont(name: "regular", size: 14)
        statusLabel.textColor = .gray
        return statusLabel

    }()

    private lazy var setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: .zero)
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 15
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        return setStatusButton
    }()

    private var statusTextFieldLeadingAnchor: NSLayoutConstraint!

    private var statusTextFieldTrailingAnchor: NSLayoutConstraint!

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField(frame: .zero)
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont(name: "regular", size: 15)
        statusTextField.textColor = .black
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.addTarget(self,
                                  action: #selector(statusTextChanged),
                                  for: .editingChanged)
        statusTextFieldLeadingAnchor = statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 162)
        statusTextFieldTrailingAnchor = statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        return statusTextField
    }()

        override init(frame: CGRect) {
            super.init(frame: .zero)
                  self.backgroundColor = UIColor(
                      red: 242/255,
                      green: 242/255,
                      blue: 247/255,
                      alpha: 0.6)
            addSubviews([
                      fullNameLabel,
                      statusLabel,
                      statusTextField,
                      setStatusButton,
                  ])
                  installingСonstraints()
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    @objc func buttonPressed() {
        normalViewField(textFild: statusTextField)
        guard animatedErrors() else { return }
        guard let textPrint = statusLabel.text else {return}
        print(textPrint)
        statusLabel.text = statusText
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        guard let textString = statusTextField.text else {return}
        statusText = textString
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

}

extension ProfileHeaderView {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 130 + 16 + 16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextFieldLeadingAnchor,
            statusTextFieldTrailingAnchor,
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40 ),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16 + 130 + 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }

    private func animatedErrors() -> Bool {
        do {
            try CheckStatusText.shared.checkAuthorization(statusText: statusTextField.text)
        } catch ErrorsStatus.emptyStatusText {
            emptyField(textFild: statusTextField)
            twitching()
            return false
        } catch {
            print("Unknown error")
            return false
        }
        return true
    }

    private func emptyField(textFild: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            textFild.layer.borderColor = UIColor.red.cgColor
        })
    }

    private func normalViewField(textFild: UITextField) {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            textFild.layer.borderColor = UIColor.black.cgColor
        })
    }

    private func twitching() {
        UIView.animate(withDuration: 0.05,  animations: {
            UIView.modifyAnimations(withRepeatCount: 6, autoreverses: true) {
                self.statusTextFieldLeadingAnchor.constant = 157
                self.statusTextFieldTrailingAnchor.constant = -21
                self.layoutIfNeeded()
            }
        }) {_ in
            self.statusTextFieldLeadingAnchor.constant = 162
            self.statusTextFieldTrailingAnchor.constant = -16
        }
    }

}
