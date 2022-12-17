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
        let nextImage = UIImageView(image: UIImage(systemName: "arrow.forward"))
        nextImage.tintColor = .black
        nextImage.translatesAutoresizingMaskIntoConstraints = false
        return nextImage
    }()

    lazy var imageOne: UIImageView = {
        let imageOne = UIImageView(image: UIImage(named: "photo_01"))
        imageSettings(imageOne)
        return imageOne
    }()

    lazy var imageTwo: UIImageView = {
        let imageTwo = UIImageView(image: UIImage(named: "photo_02"))
        imageSettings(imageTwo)
        return imageTwo
    }()

    lazy var imageThree: UIImageView = {
        let imageThree = UIImageView(image: UIImage(named: "photo_03"))
        imageSettings(imageThree)
        return imageThree
    }()

    lazy var imageFour: UIImageView = {
        let imageFour = UIImageView(image: UIImage(named: "photo_04"))
        imageSettings(imageFour)
        return imageFour
    }()

    private lazy var stackImage: UIStackView = {
        let stackImage = UIStackView()
        stackImage.axis = .horizontal
        stackImage.distribution = .fillEqually
        stackImage.alignment = .fill
        stackImage.spacing = 8
        stackImage.translatesAutoresizingMaskIntoConstraints = false
        stackAddArrangedSubview(stackImage, [
            imageOne,
            imageTwo,
            imageThree,
            imageFour
        ])
        return stackImage
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubviews([
            nameLabel,
            nextImage,
            stackImage
        ])
        installingСonstraints()
    }

}

extension PhotosTableViewCell {

    private func stackAddArrangedSubview(_ stack: UIStackView,_ arrayView: [UIView]) {
        arrayView.forEach {
            stack.addArrangedSubview($0)
        }
    }

    private func imageSettings(_ image: UIImageView) {
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
    }

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            nextImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            nextImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nextImage.heightAnchor.constraint(equalToConstant: 22),
            nextImage.widthAnchor.constraint(equalToConstant: 22),
            stackImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            stackImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            imageOne.widthAnchor.constraint(equalTo: imageOne.heightAnchor)
        ])
    }
    
}
