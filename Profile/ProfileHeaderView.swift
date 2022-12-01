//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

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

    @objc func buttonPressed() {
        guard let textPrint = textStatus.text else {return}
        print(textPrint)
    }
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

    init() {
        super.init(frame: CGRect(x: 0,
                                 y: 0,
                                 width: 200,
                                 height: 200))
    }

    override func layoutSubviews() {
        nameCat.frame = CGRect(x: 0, y: Int(frame.maxY) / 9 + 27, width: 100, height: 30)
        nameCat.center.x = center.x
        addSubview(nameCat)
        textStatus.frame = CGRect(x: 0, y: Int(frame.maxY) / 9 + 84, width: 200, height: 30)
        textStatus.center.x = center.x + 50
        addSubview(textStatus)
        avatar.frame = CGRect(x: 16,
                              y: Int(frame.maxY) / 9 + 16,
                              width: 100,
                              height: 100)
        addSubview(avatar)
        button.frame = CGRect(x: 0,
                              y: Int(frame.maxY) / 9 + 132,
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

}
