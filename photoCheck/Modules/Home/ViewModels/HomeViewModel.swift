//
//  HomeViewModel.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import Foundation

class HomeViewModel {
    
    var service: Service
    var error: Error?
    weak var delegate: ProtocolViewModel?
    private(set) var photoData: [PhotoModel] = []

    init(service: Service) {
        self.service = service
    }
}

extension HomeViewModel {
    
    @MainActor
    func fetchPhotos() {
        service.fetchPhotos { [weak self] result in
            switch result {
                
            case .success(let data):
                self?.photoData = data
                self?.delegate?.didFinish()
               // print(data.count)
                
            case .failure(let error):
                self?.error = error
                self?.delegate?.didFail(error: error)
                //print(error)
            }
        }
    }
    
    
}
