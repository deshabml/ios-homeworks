//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Лаборатория on 17.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private var dataSource: [String] = Photos.shared.photos

    private var isBigView: Bool = false

    private lazy var backView: UIView = {
        let backView = UIView()
        backView.alpha = 0
        backView.isHidden = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()

    private lazy var bigView: UIImageView = {
        let bigView = UIImageView()
        bigView.alpha = 0
        bigView.isHidden = true
        bigView.translatesAutoresizingMaskIntoConstraints = false
        return bigView
    }()

    private lazy var exitImage: UIButton = {
        let exitImage = UIButton()
        exitImage.setImage(UIImage(systemName: "xmark"), for: .normal)
        exitImage.addTarget(self,
                            action: #selector(buttonExitPressed),
                            for: .touchUpInside)
        exitImage.isHidden = true
        exitImage.translatesAutoresizingMaskIntoConstraints = false
        return exitImage
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubviews([
            collectionView,
            backView,
            bigView,
            exitImage
        ])
        installingСonstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        titleSetting()
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

}

extension PhotosViewController {

    private func titleSetting() {
        title = "Photo Gallery"
        let novigationBarColor = UINavigationBarAppearance()
        novigationBarColor.titleTextAttributes = [.foregroundColor: UIColor.black]
        novigationBarColor.backgroundColor = UIColor(
            red: 247/255,
            green: 247/255,
            blue: 247/255,
            alpha: 1.0)
        navigationItem.scrollEdgeAppearance = novigationBarColor
    }
    
    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bigView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            bigView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            bigView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            bigView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            exitImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            exitImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16)
        ])
    }

    private func onTap() {
        guard isBigView == false else { return }
        isBigView = true
        exitImage.alpha = 0
        self.exitImage.isHidden = false
        self.backView.isHidden = false
        self.bigView.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.backView.backgroundColor = .white
            self.backView.alpha = 0.5
        }) {_ in
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.bigView.alpha = 1
            })
        }
        UIView.animate(withDuration: 0.3, delay: 0.5, animations: {
            self.exitImage.alpha = 1
        })

    }

    @objc func buttonExitPressed() {
        UIView.animate(withDuration: 0.5, delay: 0, animations: {
            self.bigView.alpha = 0
            self.backView.alpha = 0
        }) {_ in
            self.backView.backgroundColor = UIColor(white: 1, alpha: 0)
            self.backView.isHidden = true
            self.bigView.isHidden = true
            self.exitImage.isHidden = true
        }
        isBigView = false
    }

}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photo: dataSource[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 32) / 3, height: (UIScreen.main.bounds.width - 32) / 3)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        bigView.image = UIImage(named: dataSource[indexPath.item])
        onTap()
    }

}
