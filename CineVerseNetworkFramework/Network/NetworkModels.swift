//
//  NetworkModels.swift
//  CineVerse
//
//  Created by chandru-13685 on 02/04/24.
//

import Foundation


public enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}


public struct NetworkResponse<T> {
    public let data: T
    public let response: URLResponse?
}
