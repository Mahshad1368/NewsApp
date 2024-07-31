//
//  EmptyStateView.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 30.07.24.
//

import UIKit

class EmptyStateView: UIView {

    
    private let emptyStateViewImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        iv.alpha = 0.45
        return iv
    }()
 
    
    private let textToDisplay = NewsLable(fontStyle: .headline, numberOfLines: 0, textAlignment: .center)
    
    init(imageSystemNamw: String, text: String){
        super.init(frame: .zero)
        
        let config = UIImage.SymbolConfiguration(pointSize: 100, weight: .regular, scale: .large)
        
        emptyStateViewImage.image = UIImage(systemName: imageSystemNamw, withConfiguration: config)
        textToDisplay.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
   
        addSubViews(views: [emptyStateViewImage, textToDisplay])
        
        NSLayoutConstraint.activate([
            emptyStateViewImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            emptyStateViewImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            emptyStateViewImage.widthAnchor.constraint(equalToConstant: 120),
            emptyStateViewImage.heightAnchor.constraint(equalToConstant: 120),
            
            
            textToDisplay.topAnchor.constraint(equalTo: emptyStateViewImage.bottomAnchor, constant: 5),
            textToDisplay.centerXAnchor.constraint(equalTo: centerXAnchor),
            textToDisplay.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20),
            textToDisplay.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
