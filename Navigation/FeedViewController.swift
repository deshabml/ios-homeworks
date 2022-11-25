//
//  FeedViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var button: UIButton = {
        var button = UIButton(frame: CGRect(x: 50,
                                        y: 200,
                                        width: 100,
                                        height: 60))
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    var post: Post = Post(title: "Горячая новость!")


    @objc func buttonAction() {
        let pvc = PostViewController()
        pvc.post = self.post
        navigationController?.pushViewController(pvc, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(UIButton())
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        button.center.x = view.center.x
        view.addSubview(button)

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center.x = view.center.x
    }
}
