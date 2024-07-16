//
//  ViewController.swift
//  photoCheck
//
//  Created by Gaston Foncea on 16/07/2024.
//

import UIKit

class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel(service: Service())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setup()
        viewModel.delegate = self
        viewModel.fetchPhotos()
    }
    
    //MARK: Variables
    private lazy var TitleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Feed"
        lbl.font = .systemFont(ofSize: 20,weight: .bold)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 500)
        
        let view = UICollectionView(frame: .zero,collectionViewLayout: layout)
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


//MARK: Extensions -
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let item = viewModel.photoData[indexPath.item]
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.item = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let photoDetailVC = PhotoDetailViewController() // Instancia tu controlador de detalles
        let item = viewModel.photoData[indexPath.item]
        photoDetailVC.set(imageUrl: item.urls.full, date: "\(item.createdAt.toCustomString()).", description: item.altDescription)
        
        navigationController?.pushViewController(photoDetailVC, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
      
    }
}


extension HomeViewController: ProtocolViewModel {
    func didFinish() {
        collectionView.reloadData()
    }
    
    func didFail(error: any Error) {
        print(error)
    }
}


extension HomeViewController {
    
    private func setup() {
        view.backgroundColor = .white
        view.addSubview(TitleLbl)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            TitleLbl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
            TitleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            TitleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            TitleLbl.heightAnchor.constraint(equalToConstant: 30),
            
            collectionView.topAnchor.constraint(equalTo: TitleLbl.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
        ])
    }
}

