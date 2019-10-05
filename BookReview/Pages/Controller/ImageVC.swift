//
//  ImageVC.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class ImageVC: UIViewController {
    //MARK: - Variables
    var currentPage = 0
    var str = ""
    
    fileprivate var imageScrollView: ImageScrollView!
    fileprivate var isHide = true
    
    lazy var hideNavigationBar: UITapGestureRecognizer = {
        let hideNB = UITapGestureRecognizer(target: self, action: #selector(handleHideNB))
        hideNB.numberOfTapsRequired = 1
        return hideNB
    }()
    
    //MARK: - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add subview image scroll view
        imageScrollView = ImageScrollView(frame: view.bounds)
        view.addSubview(imageScrollView)
        
        // setup images scroll view
        setupImageScrollView()
        
        // set image for image scroll view
        self.imageScrollView.set(image: UIImage(named: str)!)
        
        // setup gesturerecognizer
        view.addGestureRecognizer(self.hideNavigationBar)
        view.isUserInteractionEnabled = true
        
        // background
        view.backgroundColor = .black
    }
    
    //MARK: - Functions
    fileprivate func setupImageScrollView() {
        
        imageScrollView.translatesAutoresizingMaskIntoConstraints = false
        imageScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
    
    @objc func handleHideNB() {
        if isHide  {
            navigationController?.setNavigationBarHidden(isHide, animated: true)
            isHide = false
        } else {
            navigationController?.setNavigationBarHidden(isHide, animated: true)
            isHide = true
        }
    }
    
}
