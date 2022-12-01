//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String = "Waiting for something..."

    let nameCat: UILabel = {
        let nameCat = UILabel(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 100,
                                            height: 30))
        nameCat.text = "Hipster Cat"
        nameCat.font = UIFont.boldSystemFont(ofSize: 18)
        nameCat.textColor = .black
        return nameCat
    }()

    let textStatus: UILabel = {
        let textStatus = UILabel(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 200,
                                            height: 30))
        textStatus.text = "Waiting for something..."
        textStatus.font = UIFont(name: "regular", size: 14)
        textStatus.textColor = .gray
        return textStatus

    }()



    let button: UIButton = {
        var button = UIButton(frame: CGRect(x: 0,
                                            y: 0 + 95,
                                            width: 50,
                                            height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 15
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        return button
    }()

    let avatar: UIView = {

        var avatar = UIView(frame: CGRect(x: 16,
                                          y: 16 + 95,
                                          width: 100,
                                          height: 100))
        avatar.layer.cornerRadius = avatar.frame.size.width / 2
        avatar.clipsToBounds = true
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.borderWidth = 3
        let myLayer = CALayer()
        let myImage = UIImage(named: "The_Cat")?.cgImage
        myLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        myLayer.contents = myImage
        avatar.layer.addSublayer(myLayer)
        return avatar
    }()

    let textFildOne: UITextField = {
        let textFildOne = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        textFildOne.backgroundColor = .white
        textFildOne.layer.cornerRadius = 12
        textFildOne.layer.borderWidth = 1
        textFildOne.layer.borderColor = UIColor.black.cgColor
        textFildOne.font = UIFont(name: "regular", size: 15)
        textFildOne.textColor = .black
        textFildOne.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFildOne.frame.height))
        textFildOne.leftViewMode = .always
        return textFildOne
    }()

    init() {
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: 200,
                                 height: 200))
    }

    @objc func buttonPressed() {
        guard let textPrint = textStatus.text else {return}
        print(textPrint)
        textStatus.text = statusText
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        guard let textString = textFildOne.text else {return}
        statusText = textString
    }

    override func layoutSubviews() {
        nameCat.frame = CGRect(x: 0,
                               y: Int(frame.maxY) / 9 + 27,
                               width: 100,
                               height: 30)
        nameCat.center.x = center.x
        addSubview(nameCat)
        textStatus.frame = CGRect(x: 0,
                                  y: Int(frame.maxY) / 9 + 84,
                                  width: 200,
                                  height: 30)
        textStatus.center.x = center.x + 50
        addSubview(textStatus)
        textFildOne.frame = CGRect(x: 0,
                                   y: Int(frame.maxY) / 9 + 118,
                                   width: 200,
                                   height: 40)
        textFildOne.center.x = center.x + 50
        textFildOne.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(textFildOne)
        avatar.frame = CGRect(x: 16,
                              y: Int(frame.maxY) / 9 + 16,
                              width: 100,
                              height: 100)
        addSubview(avatar)
        button.frame = CGRect(x: 0,
                              y: Int(frame.maxY) / 9 + 172,
                              width: (Int(frame.maxX) - 32),
                              height: 50)
        button.center.x = center.x
        button.addTarget(self,
                         action: #selector(buttonPressed),
                         for: .touchUpInside)
        addSubview(button)
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
