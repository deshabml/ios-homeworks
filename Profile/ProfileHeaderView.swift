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
        return fullNameLabel
    }()

    let statusLabel: UILabel = {
        let statusLabel = UILabel(frame: .zero)
        statusLabel.text = "Waiting for something..."
        statusLabel.font = UIFont(name: "regular", size: 14)
        statusLabel.textColor = .gray
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
        fullNameLabel.frame = CGRect(x: 0,
                               y: Int(frame.maxY) / 9 + 27,
                               width: 100,
                               height: 30)
        fullNameLabel.center.x = center.x + 10
        addSubview(fullNameLabel)
        statusLabel.frame = CGRect(x: 0,
                                  y: Int(frame.maxY) / 9 + 84,
                                  width: 200,
                                  height: 30)
        statusLabel.center.x = center.x + 60
        addSubview(statusLabel)
        statusTextField.frame = CGRect(x: 0,
                                   y: Int(frame.maxY) / 9 + 118,
                                   width: 200,
                                   height: 40)
        statusTextField.center.x = center.x + 60
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
        avatarImageView.frame = CGRect(x: 16,
                              y: Int(frame.maxY) / 9 + 16,
                              width: 130,
                              height: 130)
        addSubview(avatarImageView)
        setStatusButton.frame = CGRect(x: 0,
                              y: Int(frame.maxY) / 9 + 172,
                              width: (Int(frame.maxX) - 32),
                              height: 50)
        setStatusButton.center.x = center.x
        setStatusButton.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        addSubview(setStatusButton)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)

    }

}
