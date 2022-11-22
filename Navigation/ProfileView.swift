//
//  ProfileView.swift
//  Navigation
//
//  Created by Лаборатория on 22.11.2022.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var dateOfBirth: UILabel!

    @IBOutlet weak var city: UILabel!

    @IBOutlet weak var signature: UITextView!

    override func layoutSubviews() {
        super.layoutSubviews()
        name.text = "Имя"
        dateOfBirth.text = "Дата Рождения"
        city.text = "Город"
    }
}
