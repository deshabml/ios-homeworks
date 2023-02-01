//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Лаборатория on 18.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id = "PhotosCollectionViewCell"

    lazy var ImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.frame = frame
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(ImageView)
        installingСonstraints()
    }
    
}

extension PhotosCollectionViewCell {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            ImageView.topAnchor.constraint(equalTo: topAnchor),
            ImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            ImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            ImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func setupCell(photo: String) {
        ImageView.image = UIImage(named: photo)
    }
    
}
