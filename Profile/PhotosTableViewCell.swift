//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Лаборатория on 17.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    static let id = "PhotosTableViewCell"

    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Photos"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()

    private lazy var nextImage: UIImageView = {
        nextImage = UIImageView(image: UIImage(systemName: "arrow.forward"))
        nextImage.backgroundColor = .black
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        return nextImage

    }()

    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews([
            nameLabel,
            nextImage
        ])
        installingСonstraints()
    }

}

extension PhotosTableViewCell {
    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nextImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            
            nextImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor)
        ])
    }
    
}
