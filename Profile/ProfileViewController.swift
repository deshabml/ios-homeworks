//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let header: UIView = ProfileHeaderView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        let novigationBarColor = UINavigationBarAppearance()

        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
//        novigationBarColor.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = .white

//        navigationItem.standardAppearance = novigationBarColor
        navigationItem.scrollEdgeAppearance = novigationBarColor
//        self.navigationItem.accessibilityNavigationStyle = novigationBarColor

        view.addSubview(header)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        header.frame = view.frame
    }
}
