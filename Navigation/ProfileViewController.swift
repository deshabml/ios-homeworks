//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лаборатория on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = Bundle.main.loadNibNamed("ProfileView", owner: self)?.first as! ProfileView
        nib.frame = UIScreen.main.bounds
        self.view.addSubview(nib)
    }
}
