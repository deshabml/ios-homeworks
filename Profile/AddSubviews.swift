//
//  AddSubviews.swift
//  Navigation
//
//  Created by Лаборатория on 13.12.2022.
//

import UIKit

func addSubviews(_ viewClass: UIView,_ arrayView: [UIView]) {
    arrayView.forEach {
        viewClass.addSubview($0)
    }
}
