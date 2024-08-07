//
//  PersistanceManager.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 30.07.24.
//

import Foundation


class PersistenceManager{
    static let shared = PersistenceManager()
    private init(){ }
    
    private let articlesKey = "Articles_UserDefault"
    private let defaults = UserDefaults.standard
    
    
    func addFavoriteArticle(article: Article, onSuccess: ()-> ()) {
        var favorites = getAllFavoriteArticles()     //Array<Article>()
        
        favorites.append(article)
        save(articles: favorites, onSuccess: onSuccess)
    }
    
    
     func removeFavoriteArticle (article: Article, onSuccess: () -> ()) {
        
        var favorites = getAllFavoriteArticles()
        guard let indexOfArticle = favorites.firstIndex(of: article) else { return }
        
        favorites.remove(at: indexOfArticle)
        
        save(articles: favorites, onSuccess: onSuccess)
    }
    
    
    func getAllFavoriteArticles() -> [Article]{
        guard let favoritData = defaults.object(forKey: articlesKey) as? Data ,
        let articles = try? JSONDecoder().decode([Article].self, from: favoritData) else{ return [] }
        
        return articles
    }
    
    func isArticleAlreadyFavorite(article: Article) -> Bool {
        let articles = getAllFavoriteArticles()
        return articles.contains(article)
    }
    
    private func save(articles: [Article], onSuccess: () -> ()){
        guard let dataToSave = try? JSONEncoder().encode(articles) else{return}
        
        defaults.set(dataToSave, forKey: articlesKey)
        onSuccess()
    }
}
