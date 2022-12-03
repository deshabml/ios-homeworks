//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = "Waiting for something..."

    let fullNameLabel: UILabel = {
        let fullNameLabel = UILabel(frame: .zero)
        fullNameLabel.text = "Hipster Cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .black
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return fullNameLabel
    }()

    let statusLabel: UILabel = {
        let statusLabel = UILabel(frame: .zero)
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont(name: "regular", size: 14)
        statusLabel.textColor = .gray
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        return statusLabel

    }()

    let setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: .zero)
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .blue
        setStatusButton.layer.cornerRadius = 15
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        return setStatusButton
    }()

    let avatarImageView: UIView = {
        var avatarImageView = UIView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 130,
                                                   height: 130))
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        let myLayer = CALayer()
        let myImage = UIImage(named: "The_Cat")?.cgImage
        myLayer.frame = CGRect(x: 0,
                               y: 0,
                               width: 130,
                               height: 130)
        myLayer.contents = myImage
        avatarImageView.layer.addSublayer(myLayer)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()

    let statusTextField: UITextField = {
        let statusTextField = UITextField(frame: .zero)
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.font = UIFont(name: "regular", size: 15)
        statusTextField.textColor = .black
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        return statusTextField
    }()

    init() {
        super.init(frame: .zero)
    }

    @objc func buttonPressed() {
        guard let textPrint = statusLabel.text else {return}
        print(textPrint)
        statusLabel.text = statusText
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        guard let textString = statusTextField.text else {return}
        statusText = textString
    }

    override func layoutSubviews() {

        addSubview(fullNameLabel)
        addSubview(statusLabel)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(avatarImageView)
        setStatusButton.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        addSubview(setStatusButton)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 40 ),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 130),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }

}
