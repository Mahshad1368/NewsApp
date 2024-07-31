//
//  UIView+Ext.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 24.07.24.
//

import UIKit

extension UIView {
    
    func addSubViews(views: [UIView]){
        views.forEach { view in
            addSubview(view)
        }
    }
    
    
    func pinToEdges(of superView: UIView, withPadding padding: CGFloat = 0 , considerSafeArea: Bool = false ){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: considerSafeArea ? superView.safeAreaLayoutGuide.topAnchor : superView.topAnchor, constant: padding),
            self.bottomAnchor.constraint(equalTo:  considerSafeArea ? superView.safeAreaLayoutGuide.bottomAnchor : superView.bottomAnchor, constant: -padding),
            self.leadingAnchor.constraint(equalTo:  considerSafeArea ? superView.safeAreaLayoutGuide.leadingAnchor : superView.leadingAnchor, constant: padding),
            self.trailingAnchor.constraint(equalTo:  considerSafeArea ? superView.safeAreaLayoutGuide.trailingAnchor : superView.trailingAnchor, constant: -padding)
            
        ])
    }
}
