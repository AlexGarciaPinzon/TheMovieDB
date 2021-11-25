//
//  NetworkingManager.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation

final class NetworkinManager {
    
    static let shared = NetworkinManager()
    
    private let baseImageURL = "https://image.tmdb.org/t/p/original/"
    private let apiKey = "e129eae338aa9949fc6a91b416d2331a"
    private let baseTvShowsURL = "https://api.themoviedb.org/3/tv/"

//MARK: - getTvShows
    func getTvShows(id:String?, success: @escaping(_ tvShowModelList:[TvShowModel]) -> (),failure: @escaping(_ error: String?) -> ()){
        
        guard let url = URL(string: "\(baseTvShowsURL)\( id!)?api_key=e129eae338aa9949fc6a91b416d2331a&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            //Validate the data is not null
            guard let data = data, error == nil else {
                failure("Error")
                return
            }
            do{
                let shows =  try JSONDecoder().decode(TvShowResponseModel.self, from: data)
                success(shows.results!)
            }
            catch{
                print(error)
            }
        }
        task.resume()
    }
    
}
