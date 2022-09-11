//
//  WebService.swift
//  NewsProject
//
//  Created by Mustafa Erduran on 11.09.2022.
//

import Foundation

class WebService {
    
    func getNews(url: URL, complation: @escaping ([News]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                complation(nil)
            }
            else if let data = data{
            
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    complation(newsArray)
                }
                
            }
        }.resume()
    }
    
}
