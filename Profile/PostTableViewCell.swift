//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Лаборатория on 11.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let id = "PostTableViewCell"

    lazy var image: String = ""

    lazy var author: UILabel = {
        let author = UILabel()
        author.text = ""
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.textColor = .black
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()

    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView(image: UIImage(named: image))
        postImageView.frame = frame
        postImageView.contentMode = .scaleAspectFit
        postImageView.backgroundColor = .black
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        return postImageView
    }()

    lazy var descriptionText: UILabel = {
        let descriptionText = UILabel()
        descriptionText.textColor = .systemGray
        descriptionText.font = UIFont.systemFont(ofSize: 14)
        descriptionText.numberOfLines = 0
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()

    lazy var likes: UILabel = {
        let likes = UILabel()
        likes.textColor = .black
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.numberOfLines = 0
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews([author, postImageView, descriptionText, likes])
        installingСonstraints()
    }

}

extension PostTableViewCell {

    private func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            addSubview($0)
        }
    }

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
            likes.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
}
