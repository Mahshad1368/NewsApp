//
//  ViewController.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 24.07.24.
//

import UIKit
#warning("Schriftgröße")
class HomeFeedVC: UIViewController {
    
    enum Section{
        case main
    }
    let tableView = UITableView()
    var dataSource: UITableViewDiffableDataSource<Section, Article>!
    
    var articles:[Article] = []
    
    private var containerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUITableView()
        configureRefreshControll()
        configureDataSource()
        configureVc()
        updateNewsItem()

    }
        
        private func configureRefreshControll(){
            tableView.refreshControl = UIRefreshControl()
            tableView.refreshControl?.addTarget(self, action: #selector(updateNewsItem), for: .valueChanged)
        }
        
        @objc
        func updateNewsItem(){
            
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
            }
            showLoadingSpinner()
            NetworkManager.shared.getNewsItem { (result) in
                switch result{
                case .success(let newsResponse):
                    self.updateData(articles: newsResponse.articles)
                case .failure(let error):
                    self.presentWarningAlert(title: "Fehler", message: error.rawValue)
                }
                
                self.dismissLoadingSpinner()
            }
        }

    private func configureUITableView (){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.pinToEdges(of: view)
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseID)
    }
    
    func configureDataSource (){
        dataSource = UITableViewDiffableDataSource<Section, Article>(tableView: tableView, cellProvider: { (tableView, indexPath, article) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseID, for: indexPath) as? NewsTableViewCell
            
            cell?.setCell(article: article)
            return cell
            
        })
    }
    func updateData (articles: [Article]){
        var snapshot = NSDiffableDataSourceSnapshot<Section, Article>()
        snapshot.appendSections([.main])
        snapshot.appendItems(articles)
        self.dataSource.apply(snapshot)
        self.articles = articles
    }
    
    func configureVc (){
        
        view.backgroundColor = .systemBackground
        title = "Nachrichten"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func showLoadingSpinner(){
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView?.pinToEdges(of: view)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.85
        }
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor), activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingSpinner(){
        DispatchQueue.main.async {
            self.containerView?.removeFromSuperview()
            self.containerView = nil
        }
    }
}

extension HomeFeedVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if let selectedArticle = dataSource.itemIdentifier(for: indexPath){
            let detailVC = DetailVC(article: selectedArticle, articles: articles)
            navigationController?.pushViewController(detailVC, animated: true)
        
        }
    }
}
