//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Лаборатория on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var dataSource: [Post] = posts

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
        view.addSubview(tableView)
        installingСonstraints()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

extension ProfileViewController {

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

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
            return tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell
        cell.author.text = dataSource[indexPath.item].author
        cell.image = dataSource[indexPath.item].image
        cell.descriptionText.text = dataSource[indexPath.item].description
        cell.likes.text = "Likes: \(dataSource[indexPath.item].likes)"
        cell.views.text = "Views: \(dataSource[indexPath.item].views)"
        return cell
    }

}
