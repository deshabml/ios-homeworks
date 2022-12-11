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

    lazy var descriptionText: UITextView = {
        let descriptionText = UITextView(frame: .zero)

        descriptionText.text = "dsfsdgfdsfgdfgdfffhdfghdfgh"
        descriptionText.sizeToFit()
        descriptionText.backgroundColor = .red
        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        return descriptionText
    }()




    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews([author, postImageView, descriptionText])
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
            descriptionText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)

        ])
    }
    
}
