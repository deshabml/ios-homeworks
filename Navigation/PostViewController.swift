//
//  PostViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post = Post(title: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = post.title
    }
}
