//
//  ProtocolViewModel.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import Foundation

protocol ProtocolViewModel: AnyObject {
    func didFinish()
    func didFail(error:Error)
}
