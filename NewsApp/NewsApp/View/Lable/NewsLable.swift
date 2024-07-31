//
//  NewsLable.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 26.07.24.
//

import UIKit

class NewsLable: UILabel {
    
    
    init(fontStyle: UIFont.TextStyle,numberOfLines: Int = 0, textAlignment: NSTextAlignment = .natural){
        super.init(frame: .zero)
        
        self.font = UIFont.preferredFont(forTextStyle: fontStyle)
        self.numberOfLines = numberOfLines
        self.textAlignment = textAlignment
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
