//
//  PersistanceManager.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 30.07.24.
//

import Foundation


class PersistanceManager{
    
    static let shared = PersistanceManager()
    
    private init(){ }
    
    private let articlesKey = "Articles_UserDefault"
    
    
    func addFavoriteArticle(article: Article){
        var favorites = getAllFavoriteArticles()     //Array<Article>()
        
        favorites.append(article)
        save(articles: favorites)
    }
    
    func getAllFavoriteArticles() -> [Article]{
        guard let favoritData = UserDefaults.standard.object(forKey: articlesKey) as? Data ,
              let articles = try? JSONDecoder().decode([Article].self, from: favoritData) else{ return [] }
        
        return articles
    }
    
    func iaArticleAlreadyFavorite(article: Article) -> Bool {
        let articles = getAllFavoriteArticles()
        return articles.contains(article)
    }
    
    func save(articles: [Article]){
        guard let dataToSave = try? JSONEncoder().encode(articles) else{return}
        
        UserDefaults.standard.set(dataToSave, forKey: articlesKey)
    }
}
