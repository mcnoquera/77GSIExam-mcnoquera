//
//  NetworkManager.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/12/24.
//

import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    func fetchApodDetail(completion: @escaping (Result<Apod, Error>) -> ())
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchApodDetail(completion: @escaping (Result<Apod, Error>) -> ()) {
        request(target: .apod,
                completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
