//
//  DescriptionViewController.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

struct CustomData {
    var Image: UIImage
}

class DescriptionVC: UIViewController {
    //MARK: - Variables
    
    var collectionImages: CollectionImages!
    var data = [CustomData]()
    
    fileprivate let nameLabel: UILabel = {
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 0
        name.textAlignment = .center
        name.font = UIFont.systemFont(ofSize: 20)
        return name
    }()
    
    fileprivate let imageView: UIImageView = {
        let iv = UIImageView(frame: .zero)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    fileprivate let descriptionLabel: UILabel = {
        let descr = UILabel(frame: .zero)
        descr.translatesAutoresizingMaskIntoConstraints = false
        descr.numberOfLines = 20
        descr.font = UIFont.systemFont(ofSize: 20)
        descr.minimumScaleFactor = 0.4
        descr.adjustsFontSizeToFitWidth = true
        return descr
    }()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .clear
        cv.register(DescriptionCVC.self, forCellWithReuseIdentifier: String(describing: DescriptionCVC.self))
        return cv
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        // append new element to data array
        data = [
            CustomData(Image: UIImage(named: collectionImages.main)!),
            CustomData(Image: UIImage(named: collectionImages.firstPage)!),
            CustomData(Image: UIImage(named: collectionImages.secondPage)!)
        ]
        
        // setup label name
        view.addSubview(nameLabel)
        setupLabelName()
        
        // setup image view
        view.addSubview(imageView)
        setupImageView()
        
        // setup collection view
        view.addSubview(collectionView)
        setupCollectionView()
        
        // setup description label
        view.addSubview(descriptionLabel)
        setupDescriptionLabel()
        
        // view and nb
        title = "Book"
        view.backgroundColor = #colorLiteral(red: 0.09580916911, green: 0.7906424403, blue: 1, alpha: 1)
    }
    
    //MARK: - Function
    fileprivate func setupLabelName() {
        
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
    }
    
    fileprivate func setupImageView() {
        imageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: view.frame.height/3.5).isActive = true
    }
    
    fileprivate func setupDescriptionLabel() {
        descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 80).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0).isActive = true
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.width/2.5).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: view.frame.width/1.2).isActive = true
    }
    
    func set(name: String, image: String, description: String) {
        self.nameLabel.text = name
        self.imageView.image = UIImage(named: image)
        self.descriptionLabel.text = description
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: PageVC.self) {
            let PageVC = segue.destination as! PageVC
            PageVC.imageNames = [collectionImages.main, collectionImages.firstPage, collectionImages.secondPage]
        }
    }
    
}

//MARK: - Extansion
extension DescriptionVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DescriptionCVC.self),
                                                      for: indexPath) as! DescriptionCVC
        cell.data = self.data[indexPath.item]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 45, bottom: 0, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: String(describing: PageVC.self), sender: nil)
    }
}
