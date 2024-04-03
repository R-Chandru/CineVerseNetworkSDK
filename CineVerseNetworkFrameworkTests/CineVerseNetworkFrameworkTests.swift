//
//  CineVerseNetworkFrameworkTests.swift
//  CineVerseNetworkFrameworkTests
//
//  Created by chandru-13685 on 02/04/24.
//

import XCTest
@testable import CineVerseNetworkFramework

struct TestMovieListResponse: Codable {
    let results: [TestMovieListItem]
}

struct TestMovieListItem: Codable {
    let id: Int
    let name: String?
    let title: String?
    let voteAverage: Double
    let firstAirDate: String?
    let releaseDate: String?
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case posterPath = "poster_path"
    }
}

final class CineVerseNetworkFrameworkTests: XCTestCase {
    
    // Test cases for request method
    func testRequest() {
        let networkService: CineVerseNetworkServiceProtocol = CineVerseNetworkService()
        
        let expectation = self.expectation(description: "Completion handler is called")
        
        let params: [String: String] = [:]
        
        
        networkService.request(with: CineVerseAPI.getLatestMovieList, requestID: "823464", params: params) { (result: Result<NetworkResponse<TestMovieListResponse>, Error>) in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    // Test cases for requestImage method
    func testRequestImage() {
        let networkService: CineVerseNetworkServiceProtocol = CineVerseNetworkService()
        
        let expectation = self.expectation(description: "Completion handler is called")
        
        networkService.requestImage(with: CineVerseAPI.getMovieImage, path: "/jEf57uD2UG36m0aFkWXm3EMQq8l.jpg") { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
