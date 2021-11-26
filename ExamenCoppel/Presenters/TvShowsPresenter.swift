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
typealias  TvPresenterDelegate = TvShowsPresenterDelegate & UIViewController
class TvShowsPresenter{
    
    weak var delegate: TvShowsPresenterDelegate?
    var listTvShows = [TvShowModel]()
    
//MARK: - getTvShowsPopular
    public func getTvShowsPopular(){
        //var listTvShows:[TvShowModel]?
        print("Inside TvShows Popular")
        NetworkinManager.shared.getTvShows(id: "popular"){
            self.listTvShows = $0!
            self.delegate?.presentTvShows(tvShows: self.listTvShows)
        }
    }
//MARK: - getTvShowsTopRated
    public func getTvShowsTopRated(){
        NetworkinManager.shared.getTvShows(id: "top_rated"){ self.listTvShows = $0!
            self.delegate?.presentTvShows(tvShows: self.listTvShows)
        }
    }
//MARK: - getTvShowsOnTV
    public func getTvShowsOnTV(){
        NetworkinManager.shared.getTvShows(id: "on_the_air"){ self.listTvShows = $0!
            self.delegate?.presentTvShows(tvShows: self.listTvShows)
        }
    }
//MARK: - getTvShowsAiringToday
    public func getTvShowsAiringToday(){
        NetworkinManager.shared.getTvShows(id: "airing_today"){ self.listTvShows = $0!
            self.delegate?.presentTvShows(tvShows: self.listTvShows)
        }
    }
    
    public func setViewDelegate(delegate: TvShowsPresenterDelegate){
        self.delegate = delegate
    }
}
