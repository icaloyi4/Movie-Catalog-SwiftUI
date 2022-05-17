//
//  UpcomingVIewModel.swift
//  Movie Catalog SwiftUI
//
//  Created by Rizky Haris Risaldi on 17/05/22.
//

import Foundation

class UpcomingViewModel: ObservableObject{
    @Published var upcoming : [UpcomingResult] = []
    
    init(){
        loadData()
    }
    
    func loadData(){
        let key = "fa01d5f46163b78e18c1547a4719ac4a"
                let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=\(key)&language=en-US&page=1"
        
                let session = URLSession(configuration: .default)
                
                session.dataTask(with: URL(string: url)!) { (data, _, error) in
                    guard let data = data else { return }
                    do {
                        //print(data)
                        let json = try JSONDecoder().decode(UpcomingWelcome.self, from: data)
                        print(json.results)

                        for movies in json.results {
                            DispatchQueue.main.async {
                                //print(movies)
                                self.upcoming.append(movies)
                            }
                        }
                    } catch {
                        print(String(describing: error))
                    }
                }.resume()
    }
}
