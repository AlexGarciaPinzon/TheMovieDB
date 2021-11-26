//
//  TvShowResponseModel.swift
//  ExamenCoppel
//
//  Created by Gabriel Alexandro Garcia Pinzon on 25/11/21.
//

import Foundation

struct TvShowResponseModel: Decodable{
    let page: Int?
    let results: [TvShowModel]?
    let total_pages: Int?
    let total_results: Int?
}

struct TvShowModel: Decodable{
    //Las variables comentadas son los demas valores de TvShow
    //let backdrop_path: String?
    let first_air_date: String?
    //let genre_ids:[Int]?
    //let id: Int?
    let name: String?
    //let origin_country: [String]?
    //let original_language: String?
    //let original_name: String?
    let overview: String?
    //let popularity: Double?
    let poster_path: String?
    let vote_average: Double?
    //let vote_count: Int?
}
