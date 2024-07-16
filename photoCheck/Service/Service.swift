//
//  Service.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import Foundation

class Service {
    
    let baseURL = "https://api.unsplash.com/photos/?client_id=L67CkSWPQS8wRY8946zr02X0RlVSMVfVRKsrvtz75wc"
    
    @MainActor
    func fetchPhotos(completion:@escaping(Result<[PhotoModel],Error>) ->Void) {
        
        Task { [weak self] in
            
            do{
                guard let self = self, let url = URL(string: self.baseURL) else {
                    completion(.failure(NSError(domain: "Invalid URL", code: -1)))
                    return
                }
                
                let (data,_) = try await URLSession.shared.data(from: url)
                let jsonDecoder = JSONDecoder()
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let unsplashResponse = try jsonDecoder.decode([PhotoModel].self, from: data)
                completion(.success(unsplashResponse))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}
