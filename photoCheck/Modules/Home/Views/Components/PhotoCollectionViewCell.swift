//
//  PhotoCollectionViewCell.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var view: PhotoView?
    
    var item: PhotoModel? {
        didSet{
            guard let userName = item?.user.username,
                  let image = item?.urls.full,
                  let date = item?.createdAt else {
                return
            }
            view?.set(userName: "(\(userName)", imageUrl: image, date: "\(date.formatted())")
                    
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            view!.backgroundColor = isSelected ? .lightGray : .clear
        }
    }
}

extension PhotoCollectionViewCell {
    
    private func setup() {
        
        guard view == nil else { return }
        
        view = PhotoView()
        
        self.contentView.addSubview(view!)
        
        NSLayoutConstraint.activate([
            view!.topAnchor.constraint(equalTo: contentView.topAnchor),
            view!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            view!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -10 ),            
        ])
    }
}
