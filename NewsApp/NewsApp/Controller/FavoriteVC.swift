//
//  FavoriteVC.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 30.07.24.
//

import UIKit

class FavoriteNewsItemDataSource: UITableViewDiffableDataSource<HomeFeedVC.Section, Article> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let article = itemIdentifier(for: indexPath){
                var snapshot = self.snapshot()
                snapshot.deleteItems([article])
                apply(snapshot)
                
                
                PersistenceManager.shared.removeFavoriteArticle(article: article) {
                    NotificationCenter.default.post(name: .favoritesDidChange, object: nil)
                }
                
            }
        }
    }
    
}

class FavoriteVC: HomeFeedVC {

    private let emptyStateView = EmptyStateView(imageSystemName: "star", text: "Es sind keine Favoriten verfügbar.")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.refreshControl = nil
//        navigationItem.rightBarButtonItem = editButtonItem
        NotificationCenter.default.addObserver(self, selector: #selector(updateNewsItem), name: .favoritesDidChange, object: nil)   //Anpassen
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
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
            tableView.setEditing(false, animated: true)
            navigationItem.rightBarButtonItem = nil
            tableView.isScrollEnabled = false
        }else{
            tableView.backgroundView = nil
            navigationItem.rightBarButtonItem = editButtonItem
            tableView.isScrollEnabled = true
        }
    }
    override func configureDataSource() {
        dataSource = FavoriteNewsItemDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, article) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell
            
            cell?.setCell(article: article)
            
            return cell
        })
    }

}
