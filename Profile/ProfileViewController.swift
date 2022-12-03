//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var header: UIView = {
        let header = ProfileHeaderView()
        header.translatesAutoresizingMaskIntoConstraints = false
        return header
    }()

    private lazy var changeTheTitleButton: UIButton = {
        var changeTheTitleButton = UIButton(frame: .zero)
        changeTheTitleButton.setTitle("Change the title", for: .normal)
        changeTheTitleButton.setTitleColor(.white, for: .normal)
        changeTheTitleButton.backgroundColor = .brown
        changeTheTitleButton.layer.shadowOpacity = 0.7
        changeTheTitleButton.layer.shadowRadius = 4
        changeTheTitleButton.layer.shadowColor = UIColor.black.cgColor
        changeTheTitleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        changeTheTitleButton.addTarget(self,
                         action: #selector(changeTheTitle),
                         for: .touchUpInside)
        changeTheTitleButton.translatesAutoresizingMaskIntoConstraints = false
        return changeTheTitleButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        titleSetting()
        addSubviews([
            header,
            changeTheTitleButton
            ])
        installingСonstraints()

    }

    @objc func changeTheTitle() {
        title = "Profile new"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension ProfileViewController {

    private func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            view.addSubview($0)
        }
    }

    private func titleSetting () {
        title = "Profile"
        let novigationBarColor = UINavigationBarAppearance()
        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = .white
        navigationItem.scrollEdgeAppearance = novigationBarColor
    }

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            header.heightAnchor.constraint(equalToConstant: 220),
            changeTheTitleButton.heightAnchor.constraint(equalToConstant: 50),
            changeTheTitleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            changeTheTitleButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            changeTheTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
