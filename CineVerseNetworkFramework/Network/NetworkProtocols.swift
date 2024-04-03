//
//  NetworkProtocol.swift
//  CineVerse
//
//  Created by chandru-13685 on 02/04/24.
//

import Foundation
import UIKit

public protocol CineVerseNetworkServiceProtocol {
    
    func request<T: Decodable> (
        with api: CineVerseAPI,
        requestID: String?,
        params: [String : String],
        completion: @escaping (Result<NetworkResponse<T>, Error>) -> Void
    )
    
    func requestImage (
        with api: CineVerseAPI,
        path: String,
        completion: @escaping (Result<NetworkResponse<UIImage?>, Error>) -> Void
    )
    
}
