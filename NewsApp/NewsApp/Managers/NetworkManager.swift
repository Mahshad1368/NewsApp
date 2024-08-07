//
//  NewsManagers.swift
//  NewsApp
//
//  Created by Mahshad Jafari on 24.07.24.
//

import UIKit

enum NewsError: String, Error {
    case universalError = "Es ist ein unbekannter Fehler aufgetreten."
    case unableToComplete = "Der Request konnte nicht abgeschlossen werden. Bitte überprüfe ggf. deine Internetverbindung"
    case invalidResponse = "Ungültige Serverantwort. Versuchen Sie es später erneut."
    case invalidData = "Ungültige Daten erhalten. Versuchen Sie es später erneut."
    case invalidURL = "Es wurde eine ungültige URL verwendet"
    
}
class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){ }
    
    private let baseURLString = "https://newsapi.org/v2/top-headlines?q=germany&apiKey="
    private let apikey = "c8f0c01198c5478dadd552600a51bb0c"
   
    
    func getNewsItem(completion: @escaping (Result<NewsResponse, NewsError>) -> Void) {
        let endpoint = baseURLString + apikey
        
        guard let url = URL(string: endpoint) else{
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                completion(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(newsResponse))
            } catch  {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    private let cache = NSCache<NSString, UIImage>()
    
    func downloadImage(from urlString: String?, completed: @escaping (UIImage) -> Void){
        guard let url = URL(string: urlString ?? "") else{
            completed(UIImage(imageLiteralResourceName: "placeholder"))
            return
        }
        
        let cachKey = NSString(string: url.absoluteString)
        if let image = cache.object(forKey: cachKey){
            completed(image)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){
            (data,response, error) in
            guard 
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200,
                let data = data,
                let image = UIImage(data: data) else {
                completed(UIImage(imageLiteralResourceName: "placeholder"))
                return
            }
            completed(image)
            self.cache.setObject(image, forKey: cachKey)
        }
        task.resume()
    }
}
