//
//  UIViewController.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 26.07.24.
//

import UIKit

extension UIViewController {
    
    func presentWarningAlert (title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
}
