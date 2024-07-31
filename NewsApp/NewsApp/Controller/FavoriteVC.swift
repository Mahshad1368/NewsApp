//
//  FavoriteVC.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 30.07.24.
//

import UIKit

class FavoriteVC: HomeFeedVC {

    private let emptyStateView = EmptyStateView(imageSystemNamw: "star", text: "Es sind keine Favoriten verfügbar.")
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.refreshControl = nil
        
        NotificationCenter.default.addObserver(self, selector: #selector(favoritesDidChange), name: Notification.Name("favoritesDidChange"), object: nil)
    }
    
    @objc
    func favoritesDidChange () {
        updateNewsItem()
    }
    
    
    override func configureVc (){
        view.backgroundColor = .systemBackground
        title = "Favoriten"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func updateNewsItem() {
        self.articles = PersistenceManager.shared.getAllFavoriteArticles()
        updateData(articles: articles)
        
        if articles.isEmpty {
            tableView.backgroundView = emptyStateView
        }else{
            tableView.backgroundView = nil
        }
    }

}
