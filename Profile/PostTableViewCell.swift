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

    private lazy var ImageView: UIView = {
        var ImageView = UIView(frame: .zero)
//        ImageView.layer.cornerRadius = ImageView.frame.size.width / 2
//        ImageView.clipsToBounds = true
//        ImageView.layer.borderColor = UIColor.white.cgColor
//        ImageView.layer.borderWidth = 3
        ImageView.backgroundColor = .black
        let myLayer = CALayer()
        let myImage = UIImage(named: image)?.cgImage
        myLayer.frame = CGRect(x: 50,
                               y: 50,
                               width: 300,
                               height: 300)
        myLayer.contents = myImage
        ImageView.layer.addSublayer(myLayer)
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(author)
        addSubview(ImageView)

        installingСonstraints()

    }

}

extension PostTableViewCell {
    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            author.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ImageView.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 16),
            ImageView.heightAnchor.constraint(equalTo: widthAnchor),
            ImageView.widthAnchor.constraint(equalTo: widthAnchor),
            ImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            ImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
