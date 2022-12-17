//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Лаборатория on 17.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var collectionView: UIView = {
        let collectionView = UIView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
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
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
