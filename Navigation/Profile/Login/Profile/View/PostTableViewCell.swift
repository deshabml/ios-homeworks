//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Лаборатория on 11.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let id = "PostTableViewCell"

    private lazy var index: Int = 0

    private lazy var switchMode: Bool = false

    lazy var author: UILabel = {
        let author = UILabel()
        author.text = ""
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.textColor = .black
        author.numberOfLines = 2
        return author
    }()

    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.frame = frame
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapView)))
        return postImageView
    }()

    lazy var descriptionText: UILabel = {
        let descriptionText = UILabel()
        descriptionText.textColor = .systemGray
        descriptionText.font = UIFont.systemFont(ofSize: 14)
        descriptionText.numberOfLines = 0
        return descriptionText
    }()

    lazy var likes: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.numberOfLines = 0
        likes.isUserInteractionEnabled = true
        likes.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTapLikes)))
        return likes
    }()

    lazy var views: UILabel = {
        let views = UILabel()
        views.textColor = .black
        views.font = UIFont.systemFont(ofSize: 16)
        views.numberOfLines = 0
        return views
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews([author,
                     postImageView,
                     descriptionText,
                     likes,
                     views])
        installingСonstraints()
    }

}

extension PostTableViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            postImageView.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 16),
            postImageView.heightAnchor.constraint(equalTo: widthAnchor),
            postImageView.widthAnchor.constraint(equalTo: widthAnchor),
            postImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionText.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            likes.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            views.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    @objc func onTapLikes() {
        Posts.shared.posts[index].likes += 1
        likes.text = "Likes: \(Posts.shared.posts[index].likes)"
        layoutIfNeeded()
    }

    @objc func onTapView() {
        guard switchMode else { return }
        Posts.shared.posts[index].views += 1
        views.text = "Views: \(Posts.shared.posts[index].views)"
        layoutIfNeeded()
        if let navigationController = ((superview as? UITableView)?.dataSource as? UIViewController)?.navigationController {
            let dpvc = DetailPostViewController()
            dpvc.index = index
            let nc = UINavigationController(rootViewController: dpvc)
            nc.modalPresentationStyle = .fullScreen
            nc.modalTransitionStyle = .flipHorizontal
            navigationController.present(nc, animated: true)
        }
    }

    func setupCell(post: Post, index: Int, switchMode: Bool) {
        author.text = post.author
        postImageView.image = UIImage(named: post.image)
        descriptionText.text = post.description
        likes.text = "Likes: \(Posts.shared.posts[index].likes)"
        views.text = "Views: \(Posts.shared.posts[index].views)"
        self.index = index
        self.switchMode = switchMode
    }
    
}
