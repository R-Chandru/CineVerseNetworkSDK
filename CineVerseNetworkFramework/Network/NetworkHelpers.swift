//
//  NetworkHelper.swift
//  CineVerse
//
//  Created by chandru-13685 on 29/03/24.
//

import Foundation

enum NetworkHelper {
    
    static func mergeDictionaries<Key, Value>(_ dict1: [Key: Value], _ dict2: [Key: Value]) -> [Key: Value] {
        var mergedDict = dict1
        
        for (key, value) in dict2 {
            mergedDict[key] = value
        }
        
        return mergedDict
    }

    
    static func getURL(for api: CineVerseAPI, requestID: String?, params: [String: String]) -> URL? {
        var apiString = api.urlString
        if let requestID {
            apiString = apiString.replacingOccurrences(of: "{ID}", with: requestID)
        }
        
        guard var urlComponents = URLComponents(string: apiString) else {
            return nil
        }
        
        let allParams = mergeDictionaries(params, CineVerseParamConstants.defaultParams)
        let queryItems = allParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        urlComponents.queryItems = queryItems
        
        return urlComponents.url
    }
    
    
    static func getURL(for api: CineVerseAPI, with path: String) -> URL? {
        let baseURL = URL(string: api.urlString)
        let fullURL = baseURL?.appendingPathComponent(path)
        return fullURL
    }
    
}
