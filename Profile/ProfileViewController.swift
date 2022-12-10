//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//        titleSetting()
        addSubviews([
            tableView
            ])
        installingСonstraints()

    }

//    @objc func changeTheTitle() {
//        title = "Profile new"
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }

}

extension ProfileViewController {

    private func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            view.addSubview($0)
        }
    }

//    private func titleSetting () {
//        title = "Profile"
//        let novigationBarColor = UINavigationBarAppearance()
//        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
//        novigationBarColor.backgroundColor = .white
//        navigationItem.scrollEdgeAppearance = novigationBarColor
//    }

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}
