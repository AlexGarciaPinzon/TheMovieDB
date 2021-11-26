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
    func getTvShows(id:String?, success: @escaping(_ tvShowModelList:[TvShowModel]?) -> ()){
        guard let url = URL(string: "\(baseTvShowsURL)\( id!)?api_key=e129eae338aa9949fc6a91b416d2331a&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url){data, response, error in
            //Validate the data is not null
            guard let data = data, error == nil else {
                return
            }
            do{
                let shows =  try JSONDecoder().decode(TvShowResponseModel.self, from: data)
                success(shows.results!)
            }
            catch{
                print(error)
                success(nil)
            }
        }
        task.resume()
    }
    
//MARK: - getToken
    public func getToken(success: @escaping(_ token:String?) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=\(apiKey)") else {return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data, response, error in
            guard let data = data, error == nil else {return}
            print("Inside get token")
            do{
                let tokenInfo =  try JSONDecoder().decode(TokenModel.self, from: data)
                success(tokenInfo.request_token)
                print(tokenInfo)
            }
            catch{
                print(error)
                success(nil)
            }
        }
        task.resume()
    }
//MARK: - SessionId
    public func getSessioniId(token: String, success: @escaping(_ sessionId:String?) -> ()){
        guard let url = URL(string: "https://api.themoviedb.org/3/authentication/session/new?api_key=\(apiKey)&request_token=\(token)") else {return}
        let task = URLSession.shared.dataTask(with: url){[weak self] data, response, error in
            guard let data = data, error == nil else {return}
            print("Inside get token")
            do{
                let session =  try JSONDecoder().decode(SessionModel.self, from: data)
                success(session.session_id)
                print(session)
            }
            catch{
                print(error)
                success(nil)
            }
        }
        task.resume()
    }
}
