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

    private lazy var backView: UIView = {
        let backView = UIView()
        backView.backgroundColor = UIColor(white: 1, alpha: 0)
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()

    private lazy var exitImage: UIButton = {
        let exitImage = UIButton()
        exitImage.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitImage.alpha = 0
        exitImage.addTarget(self,
                            action: #selector(buttonExitPressed),
                            for: .touchUpInside)
        exitImage.translatesAutoresizingMaskIntoConstraints = false
        return exitImage
    }()

    private lazy var avatarImageView = ProfileHeaderView().avatarImageView


    private var avatarImageViewTopAnchor: NSLayoutConstraint!

    private var avatarImageViewleadingAnchor: NSLayoutConstraint!

    private var avatarImageViewCenterXAnchor: NSLayoutConstraint!

    private var avatarImageViewCenterYAnchor: NSLayoutConstraint!

    private var avatarImageViewWidthAnchor: NSLayoutConstraint!

    private var avatarImageViewHeightAnchor: NSLayoutConstraint!



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 0.2
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        view.addSubview(tableView)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
//        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
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

}

extension ProfileViewController {

    @objc func onTap(_ tapRecognizer: UITapGestureRecognizer) {
        view.addSubview(backView)
        backView.addSubviews([
            avatarImageView,
            exitImage
        ])
        installingСonstraintsBeforeAnimation()
        installingСonstraintsAfterAnimation()
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.backView.backgroundColor = UIColor(white: 1, alpha: 0.5)
            self.view.layoutIfNeeded()
            self.avatarImageView.layer.cornerRadius = 0
        })
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
            self.exitImage.alpha = 1
        })
    }

    @objc func buttonExitPressed() {
        avatarImageViewCenterXAnchor.isActive = false
        avatarImageViewCenterYAnchor.isActive = false
        avatarImageViewWidthAnchor.isActive = false
        avatarImageViewHeightAnchor.isActive = false
        avatarImageViewTopAnchor.isActive = true
        avatarImageViewleadingAnchor.isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.backView.backgroundColor = UIColor(white: 1, alpha: 0)
            self.view.layoutIfNeeded()
            self.avatarImageView.layer.cornerRadius = 65
        }) {_ in
            self.backView.isHidden = true
            self.avatarImageView.isHidden = true
            self.view.layoutIfNeeded()
        }

    }

    private func installingСonstraintsBeforeAnimation() {
        avatarImageViewTopAnchor = avatarImageView.topAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.topAnchor, constant: 16)
        avatarImageViewleadingAnchor = avatarImageView.leadingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        avatarImageViewTopAnchor.isActive = true
        avatarImageViewleadingAnchor.isActive = true
        exitImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16).isActive = true
        exitImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16).isActive = true
        view.layoutIfNeeded()
    }

    private func installingСonstraintsAfterAnimation() {
        avatarImageViewTopAnchor.isActive = false
        avatarImageViewleadingAnchor.isActive = false
        avatarImageViewCenterXAnchor = avatarImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        avatarImageViewCenterYAnchor = avatarImageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        avatarImageViewWidthAnchor = avatarImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        avatarImageViewHeightAnchor = avatarImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        avatarImageViewCenterXAnchor.isActive = true
        avatarImageViewCenterYAnchor.isActive = true
        avatarImageViewWidthAnchor.isActive = true
        avatarImageViewHeightAnchor.isActive = true
    }

}
