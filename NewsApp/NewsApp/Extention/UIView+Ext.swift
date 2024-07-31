//
//  UIView+Ext.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 24.07.24.
//

import UIKit

extension UIView {
    func pinToEdges(of superView: UIView, withPadding padding: CGFloat = 0){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -padding),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: padding),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -padding)
            
        ])
    }
}
