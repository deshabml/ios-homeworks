//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Лаборатория on 18.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"

    lazy var imageName: String = ""

    lazy var ImageView: UIImageView = {
        let ImageView = UIImageView(image: UIImage(named: imageName))
        ImageView.frame = frame
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(ImageView)
        installingСonstraints()
    }
    
}

extension PhotosCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            ImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
}
