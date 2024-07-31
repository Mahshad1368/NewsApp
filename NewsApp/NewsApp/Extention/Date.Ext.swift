//
//  Date.Ext.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 26.07.24.
//

import Foundation

extension Date {
    func
    getStringRepreaentation() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd. MM yyyy - HH:mm"
        
        return  dateFormatter.string(from: self)
    }
}
