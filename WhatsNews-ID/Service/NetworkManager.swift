//
//  NetworkManager.swift
//  WhatsNews-ID
//
//  Created by Felinda Gracia Lubis on 7/4/20.
//  Copyright © 2020 Felinda Lubis. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var news = [Article]()
    
    func fetchData() {
        if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=id&apiKey=\(Token.MY_API_KEY)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    if let safeData = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedData = try decoder.decode(NewsModel.self, from: safeData)
                            DispatchQueue.main.async {
                                self.news = decodedData.articles
                                print(self.news[0].title)
                            }
                        } catch {
                            print("Error fetching data, \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
