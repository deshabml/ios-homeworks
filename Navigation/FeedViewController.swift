//
//  FeedViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var buttonOne: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        return button
    }()

    private lazy var buttonTwo: UIButton = {
        var button = UIButton(frame: .zero)
        button.setTitle("Пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self,
                         action: #selector(buttonAction),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var post: Post = Post(title: "Горячая новость!")

    private lazy var stackButton: UIStackView = {
        let stackButton = UIStackView()
        stackButton.axis = .vertical
        stackButton.distribution = .fillEqually
        stackButton.alignment = .fill
        stackButton.spacing = 10
        stackButton.translatesAutoresizingMaskIntoConstraints = false
        stackButton.addArrangedSubview(buttonOne)
        stackButton.addArrangedSubview(buttonTwo)
        return stackButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.addSubview(stackButton)
        installingСonstraints()
    }

    @objc func buttonAction() {
        let pvc = PostViewController()
        pvc.post = self.post
        navigationController?.pushViewController(pvc, animated: true)
    }

}

extension FeedViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            stackButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackButton.heightAnchor.constraint(equalToConstant: 120),
            stackButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}
