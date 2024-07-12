//
//  HomeViewModel.swift
//  Tech-Exam
//
//  Created by Mark Angelo Noquera on 7/12/24.
//

import UIKit

class HomeViewModel {
    
    private let networkManager: NetworkManager = NetworkManager()
    
    var copyright: String = ""
    var date: String = ""
    var explanation: String = ""
    var hdurl: String = ""
    var mediaType: String = ""
    var serviceVersion: String = ""
    var title: String = ""
    var url: String = ""
    
    func loadApod(completion: @escaping (Bool) -> ()) {
        networkManager.fetchApodDetail(completion: { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
                case .success(let reponseData):
                strongSelf.setApoData(reponseData)
                completion(true)
                case .failure(let error):
                completion(false)
                }
            })
    }
    
    func setApoData(_ apod: Apod) {
        self.copyright = apod.copyright ?? ""
        self.date = apod.date ?? ""
        self.explanation = apod.explanation ?? ""
        self.hdurl = apod.hdurl ?? ""
        self.mediaType = apod.mediaType ?? ""
        self.serviceVersion = apod.serviceVersion ?? ""
        self.title = apod.title ?? ""
        self.url = apod.url ?? ""
    }
}
