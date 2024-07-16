//
//  Extensions.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import Foundation

extension Date {
    func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        if let date = dateFormatter.date(from: self.description) {
            dateFormatter.dateFormat = "dd-MM-yy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    func toCustomString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Asegurarse de que el formato sea en inglés
        return dateFormatter.string(from: self).uppercased() // Convertir a mayúsculas
    }

}
