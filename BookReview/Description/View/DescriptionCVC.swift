//
//  DescriptionCVC.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class DescriptionCVC: UICollectionViewCell {
    
    var data: CustomData? {
          didSet {
              guard let data = data else { return }
            imageView.image = data.Image
              
          }
      }
    
    fileprivate let imageView: UIImageView  = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
