//
//  NetworkConstants.swift
//  CineVerse
//
//  Created by chandru-13685 on 29/03/24.
//

import Foundation

public enum CineVerseParamConstants {
    
    static let defaultParams: [String: String] = [
        "api_key" : "909594533c98883408adef5d56143539"
    ]
    
}


public enum CineVerseAPI {
    
    case getLatestMovieList
    case getPopularMovieList
    
    case getMovieImage
    case getMovieDetail
    case getMovieDetailCredits
    case getMovieDetailKeywords
    
    
    var urlString: String {
        switch self {
        
        // Movie List API's
        case .getLatestMovieList:
            return "https://api.themoviedb.org/3/trending/all/day"
        case .getPopularMovieList:
            return "https://api.themoviedb.org/3/discover/movie"
            
        // Movie Detail API's
        case .getMovieImage:
            return "https://image.tmdb.org/t/p/original"
        case .getMovieDetail:
            return "https://api.themoviedb.org/3/movie/{ID}"
        case .getMovieDetailCredits:
            return "https://api.themoviedb.org/3/movie/{ID}/credits"
        case .getMovieDetailKeywords:
            return "https://api.themoviedb.org/3/movie/{ID}/keywords"
            
        }
    }
    
}
