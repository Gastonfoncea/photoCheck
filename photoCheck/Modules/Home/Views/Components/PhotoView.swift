//
//  PhotoView.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import UIKit
import SDWebImage

class PhotoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   //MARK: Variables -
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode =  .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 12,weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var dateLbl: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.textColor = .systemBlue
        lbl.font = .systemFont(ofSize: 10,weight: .bold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var Hstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userNameLbl,dateLbl])
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 20
        return stack
    }()
    
    
    //MARK: Funciones para inicializar -
    
    func set(userName:String, imageUrl: URL, date: String) {
        userNameLbl.text = userName
        dateLbl.text = date
        imageView.sd_setImage(with: imageUrl,completed: nil)
        
    }
}


extension PhotoView {
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        self.addSubview(Hstack)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 450),
            
            Hstack.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            Hstack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            Hstack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            Hstack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ])
    }
}
