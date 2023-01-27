//
//  PostViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    lazy var postOne: PostOne = PostOne(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = postOne.title
        let myButten = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(buttonAction))
        navigationItem.rightBarButtonItem = myButten
    }

    @objc func buttonAction() {
        let ivc = InfoViewController()
        present(ivc, animated: true)
    }
    
}
