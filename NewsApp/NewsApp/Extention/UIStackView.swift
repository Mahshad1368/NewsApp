//
//  UIStackView.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 26.07.24.
//

import UIKit


extension UIStackView {
     
    func addArrangedSubviews(_ views: [UIView]){
        views.forEach { view in
            self.addArrangedSubview(view)
        }
        
    }
    
//    func removeAllArrangedSubviews() {
//            let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
//                self.removeArrangedSubview(subview)
//                return allSubviews + [subview]
//            }
//            
//            NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
//            
//            removedSubviews.forEach({ $0.removeFromSuperview() })
//    }


    
//    Bitte kopiere aber stattdessen die folgende Methode (ich verwende in den nachfolgenden Lektionen ebenfalls diesen Code…)
//    
    func removeAllArrangedSubviews() {
        arrangedSubviews.forEach {  // subwiew in $0 = subview
                self.removeArrangedSubview($0)
                NSLayoutConstraint.deactivate($0.constraints)
                $0.removeFromSuperview()
        }
    }
}
