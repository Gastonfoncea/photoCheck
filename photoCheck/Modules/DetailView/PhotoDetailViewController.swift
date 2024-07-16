//
//  DetailViewController.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    //MARK: Variables -
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode =  .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var dateTitle: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 25,weight: .black)
        return lbl
    }()
    
    private var descriptionPhoto: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        return lbl
    }()

    
    //MARK: Functions -
    func set(imageUrl: URL,date: String, description:String) {
        imageView.sd_setImage(with: imageUrl,completed: nil)
        descriptionPhoto.text = description
        
       // let modifiedtext = "\(date)".replacingOccurrences(of: " 2024", with: "\n2024")
        dateTitle.text = date
    }
    
}

extension PhotoDetailViewController {
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(dateTitle)
        view.addSubview(imageView)
        view.addSubview(descriptionPhoto)
        
        NSLayoutConstraint.activate([
            dateTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            dateTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateTitle.heightAnchor.constraint(equalToConstant: 30),
            
            // imageView constraints
            imageView.topAnchor.constraint(equalTo: dateTitle.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 550),
            
            // descriptionPhoto constraints
            descriptionPhoto.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            descriptionPhoto.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionPhoto.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
          
        ])
    }
}


extension PhotoDetailViewController {
    

}
