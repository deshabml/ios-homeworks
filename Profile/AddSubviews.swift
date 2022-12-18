//
//  AddSubviews.swift
//  Navigation
//
//  Created by Лаборатория on 13.12.2022.
//

import UIKit

extension UIView {

    func addSubviews(_ arrayView: [UIView]) {
        arrayView.forEach {
            self.addSubview($0)
        }
    }
    
}
