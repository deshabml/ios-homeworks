//
//  LogInViewController.swift
//  Navigation
//
//  Created by Лаборатория on 07.12.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = LogInScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)        
        installingСonstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logInButtonEvents()
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(scrollView)
        NotificationCenter.default.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

extension LogInViewController {

    private func installingСonstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func logInButtonEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(buttonActionLogIn), name: Notification.Name("Button Log In up"), object: nil)
    }

    @objc func buttonActionLogIn() {
        let pvc = ProfileViewController()
        navigationController?.pushViewController(pvc, animated: true)
    }

}
