//
//  NetworkManager.swift
//  CineVerse
//
//  Created by chandru-13685 on 29/03/24.
//

import Foundation
import UIKit


public class CineVerseNetworkService: CineVerseNetworkServiceProtocol {
    
    public init() {}
    
    public func request<T: Decodable> (
        with api: CineVerseAPI,
        requestID: String?,
        params: [String : String],
        completion: @escaping (Result<NetworkResponse<T>, Error>) -> Void
    ) {
        guard let networkURL = NetworkHelper.getURL(for: api, requestID: requestID, params: params) else {
            return
        }
        
        URLSession.shared.dataTask(with: networkURL) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(NetworkError.invalidURL))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                let networkResponse = NetworkResponse(data: decodedData, response: httpResponse)
                completion(.success(networkResponse))
            } catch {
                completion(.failure(NetworkError.decodingError))
            }
        }.resume()
    }
    
    
    public func requestImage (
        with api: CineVerseAPI,
        path: String,
        completion: @escaping (Result<NetworkResponse<UIImage?>, Error>) -> Void
    ) {
        guard let networkURL = NetworkHelper.getURL(for: api, with: path) else {
            return
        }
        
        URLSession.shared.dataTask(with: networkURL) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(NetworkError.decodingError))
                return
            }
            DispatchQueue.main.async {
                let response = NetworkResponse(data: UIImage(data: data), response: nil)
                completion(.success(response))
            }
        }.resume()
    }
    
}
