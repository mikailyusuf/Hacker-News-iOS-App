//
//  NetworkManager.swift
//  Hacker News
//
//  Created by Mikail on 16/01/2022.
//

import Foundation

class NetworkManager : ObservableObject{
    
    @Published var post  = [Post]()
    
    func fetch(){
        if  let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
            
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                            let result = try decoder.decode(Results.self,from: safeData)
                            DispatchQueue.main.async {
                                self.post = result.hits
                            }
                            
                        }
                        catch {
                            print(error)
                        }
                        
                    }
                   
                }
                
            }
            task.resume()
        }
    }
}
