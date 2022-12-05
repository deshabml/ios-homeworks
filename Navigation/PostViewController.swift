//
//  PostViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    lazy var post: Post = Post(title: "")

    @objc func buttonAction() {
        let ivc = InfoViewController()
        present(ivc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = post.title
        let myButten = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = myButten
    }
}
