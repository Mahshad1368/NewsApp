//
//  NewsButton.swift
//  TippsUndTricks
//
//  Created by Mahshad Jafari on 23.07.24.
//

import Foundation
import UIKit


class NewsButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(backgroundColor: UIColor, title: String){
        self.init(frame: CGRect.zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func  configure(){
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 12
    }
}
