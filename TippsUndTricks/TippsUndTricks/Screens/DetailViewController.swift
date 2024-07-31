//
//  DetailViewController.swift
//  TippsUndTricks
//
//  Created by Mahshad Jafari on 23.07.24.
//

import Foundation
import SafariServices

protocol NewsItemFavoritable: class {
    
    func newsItemFavoritesStatusChanged(stillFavorite: Bool)
}


class DetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    let newsImageView = NewsImage(frame: .zero)
    let newsTitle = NewsLable(fontSize: 20, fontWeight: .semibold)
    let newsDescription = NewsLable(fontSize: 16, fontWeight: .regular)
    let readArticleButton = NewsButton(backgroundColor: .systemPurple, title: "Ganzen Artikel lesen")
    
    let padding: CGFloat = 20
    
    var newsItem: NewsItem!
    weak var delegate: NewsItemFavoritable?
    var isNewsItemFavorites: Bool{
        willSet{
            if newValue{
                navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
            }else {
                navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
            }
        }
    }
}
