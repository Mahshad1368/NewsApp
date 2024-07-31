//
//  DetailVC.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 26.07.24.
//

import UIKit
import SafariServices

class DetailVC: UIViewController {

    private let titleLable = NewsLable(fontStyle: .headline)
    private let imageView = NewsImageView(frame: .zero)
    private let infoLable = NewsLable(fontStyle: .footnote, textAlignment: .center)
    private let contentLable = NewsLable(fontStyle: .body)
    private let readArticlebutton = NewsButton(backgroundColor: .systemBlue, title: "Zum ganzen Artikel")
    
    private let stackView = UIStackView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    var article: Article!{
        didSet{
            guard let articles = articles, 
            let currentIndex = articles.firstIndex(of: article) else {
                upButton.isEnabled = false
                downButton.isEnabled = false
                
                return
            }
            if currentIndex == 0{
                upButton.isEnabled = false
            }else{
                upButton.isEnabled = true
            }
            if currentIndex == articles.count - 1{
                downButton.isEnabled = false
            }else{
                downButton.isEnabled = true
            }
        }
    }
    
    
    
    
   private var articles : [Article]?
    
    
    let config = UIImage.SymbolConfiguration(pointSize: 21, weight: .semibold)
    
    
    lazy var upButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up", withConfiguration: config), style: .plain, target: self, action: #selector(handleUpButtonDidTap))
                                   
    
    
    lazy var downButton = UIBarButtonItem(image: UIImage(systemName: "arrow.down", withConfiguration: config), style: .plain, target: self, action: #selector(handleDownButtonDidTap))

    
    
    lazy var favoriteButton = UIBarButtonItem(image: UIImage(systemName: "star", withConfiguration: config), style: .plain, target: self, action: #selector(handleFavoritButtonDidTap))
                                              
                                              
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .never
        configureReadArticle()
        configureUi()
        setElement(article: article)
//        addFavoriteArticle(article: articles)
        
        navigationItem.rightBarButtonItems = [downButton, upButton,favoriteButton]
        

    }
    init(article: Article, articles: [Article]){
        super.init(nibName: nil, bundle: nil)
     
        self.articles = articles
        ({ self.article = article})()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
         
    @objc
     private func handleFavoritButtonDidTap(){
        
         if PersistenceManager.shared.isArticleAlreadyFavorite(article: article){
             PersistenceManager.shared.removeFavoriteArticle(article: article){
                 favoriteButton.image = UIImage(systemName: "star", withConfiguration:  config)
                 NotificationCenter.default.post(name: Notification.Name("favoritesDidChange"), object: nil)
             }
            
         }else{
             PersistenceManager.shared.addFavoriteArticle(article: article){
                 favoriteButton.image = UIImage(systemName: "star.fill", withConfiguration:  config)
                 NotificationCenter.default.post(name: Notification.Name("favoritesDidChange"), object: nil)
             }
             
         }
         
    }

    @objc
    private func handleDownButtonDidTap(){
        guard let currentIndex = articles?.firstIndex(of: article),
                let nextArticle = articles?[currentIndex + 1 ] else{ return }
        
        article = nextArticle
        setElement(article: article)
    }
    @objc
    private func handleUpButtonDidTap(){
        guard let currentIndex = articles?.firstIndex(of: article),
                let nextArticle = articles?[currentIndex - 1 ] else{ return }
        
        article = nextArticle
        setElement(article: article)
    }
                                   
    private func configureReadArticle (){
        readArticlebutton.addTarget(self, action: #selector(handleReadArticleButtonDidTap), for: .touchUpInside)
    }
 
    
    @objc
    private func handleReadArticleButtonDidTap (){
        guard let url = URL(string: article.url ?? "") else{ 
           presentWarningAlert(title: "Fehler", message: "Die gewünschte URL konnte nicht geöffnet werden.")
            return }
        
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        let safariVC = SFSafariViewController(url: url, configuration: config)
        present(safariVC, animated: true)
        
    }
    
    private func configureUi(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.pinToEdges(of: view, considerSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.pinToEdges(of: scrollView)
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        
        contentView.addSubview(stackView)
        stackView.pinToEdges(of: contentView, withPadding: 10, considerSafeArea: true)
    
    }
    
    func setElement(article: Article){
        stackView.removeAllArrangedSubviews()
        
        stackView.addArrangedSubviews([titleLable,imageView,infoLable,contentLable,readArticlebutton])
        
        
        self.titleLable.text = article.title
        self.contentLable.text = article.content
        self.infoLable.text = "Autor: \(article.author ?? "N/A") /\(article.publishedAt?.getStringRepreaentation() ?? "N/A") Uhr "

        self.imageView.setImage(urlString: article.urlToImage)
        
        favoriteButton.image = PersistenceManager.shared.isArticleAlreadyFavorite(article: article) ? UIImage(systemName: "star.fill", withConfiguration: config) : UIImage(systemName: "star", withConfiguration: config)
        
    }

}
