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

    private lazy var phv: UIView = {
        let phv = ProfileHeaderView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        phv.avatarImageView.isUserInteractionEnabled = true
        phv.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
        return phv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0.2
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        view.addSubview(tableView)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
//        ProfileHeaderView.ima
        
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
        return phv
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let pvc = PhotosViewController()
            navigationController?.pushViewController(pvc, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as! PhotosTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as! PostTableViewCell
            cell.author.text = dataSource[indexPath.item].author
            cell.image = dataSource[indexPath.item].image
            cell.descriptionText.text = dataSource[indexPath.item].description
            cell.likes.text = "Likes: \(dataSource[indexPath.item].likes)"
            cell.views.text = "Views: \(dataSource[indexPath.item].views)"
            return cell
        }
    }

    @objc func onTap(_ tapRecognizer: UITapGestureRecognizer) {
        let backView = UIView()
        view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = UIColor(white: 1, alpha: 0)
        backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        let avatarImageView = ProfileHeaderView().avatarImageView
        view.addSubview(avatarImageView)
        var avatarImageViewTopAnchor = avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        var avatarImageViewleadingAnchor = avatarImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        avatarImageViewTopAnchor.isActive = true
        avatarImageViewleadingAnchor.isActive = true
//        phv.avatarImageView.backgroundColor = .white
        view.layoutIfNeeded()
        avatarImageViewTopAnchor.isActive = false
        avatarImageViewleadingAnchor.isActive = false
        avatarImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            backView.backgroundColor = UIColor(white: 1, alpha: 0.5)
            self.view.layoutIfNeeded()
            avatarImageView.layer.cornerRadius = 0
        })
//        UIView.animate(withDuration: 0.3, delay: 0, animations: {
//            backView.backgroundColor = UIColor(white: 1, alpha: 0.5)
//            self.view.layoutIfNeeded()
//            avatarImageView.layer.cornerRadius = 0
//        })

    }

}
