//
//  InfoViewController.swift
//  Navigation
//
//  Created by Лаборатория on 24.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var button: UIButton = {
        var button = UIButton(frame: CGRect(x: 50,
                                            y: 200,
                                            width: 140,
                                            height: 60))
        button.setTitle("Сообщение", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(
            red: 211/255,
            green: 154/255,
            blue: 4/255,
            alpha: 1.0)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 4/255,
            green: 129/255,
            blue: 59/255,
            alpha: 1.0)
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

    @objc func buttonAction(_ sender: UIButton) {
        let avc = UIAlertController(title: "Новость века!", message: "По секрету, \n всему свету!", preferredStyle: .alert)
        avc.addAction(UIAlertAction(title: "Отмена", style: .cancel){ _ in
            print("Сообщение")
            avc.dismiss(animated: true)
        })
        avc.addAction(UIAlertAction(title: "Cообщение", style: .default){ _ in
            print("Сообщение")
        })
        present(avc, animated: true)
    }

}
