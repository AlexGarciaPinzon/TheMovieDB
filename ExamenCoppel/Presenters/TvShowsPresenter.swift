//
//  TvShowsPresenter.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation
import UIKit

protocol TvShowsPresenterDelegate: AnyObject {
    func presentTvShows(tvShows: [TvShowModel])
}

class TvShowsPresenter{
    
    weak var delegate: TvShowsPresenterDelegate?

//MARK: - getTvShowsPopular
    public func getTvShowsPopular() -> [TvShowModel]{
        
        var listTvShows:[TvShowModel]?
        
        NetworkinManager.shared.getTvShows(id: "popular"){ (tvShowModelList) in
            //print("Case success")
            //print(tvShowModelList)
            listTvShows = tvShowModelList
        }failure: { (error) in
            print("Error")
            
        }
        //This should be fixed it might be a bug
        return listTvShows!
    }
//MARK: - getTvShowsTopRated
    public func getTvShowsTopRated(){
        NetworkinManager.shared.getTvShows(id: "top_rated"){ (tvShowModelList) in
            print("Case success")
            print(tvShowModelList)
        }failure: { (error) in
            print("Error")
        }
    }
//MARK: - getTvShowsOnTV
    public func getTvShowsOnTV(){
        NetworkinManager.shared.getTvShows(id: "on_the_air"){ (tvShowModelList) in
            print("Case success")
            print(tvShowModelList)
        }failure: { (error) in
            print("Error")
        }
    }
//MARK: - getTvShowsAiringToday
    public func getTvShowsAiringToday(){
        NetworkinManager.shared.getTvShows(id: "airing_today"){ (tvShowModelList) in
            print("Case success")
            print(tvShowModelList)
        }failure: { (error) in
            print("Error")
        }
    }
    
}
