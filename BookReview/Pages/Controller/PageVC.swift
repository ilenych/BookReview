//
//  PageVC.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    // - Variables
    var imageNames = [String]()
    
    // - Cycle life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Review"
        
        dataSource = self
        
        if let contentPageVC = self.showViewControllerAtIndex(0) {
            setViewControllers([contentPageVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    // - Function
    fileprivate func showViewControllerAtIndex(_ index: Int) -> ImageVC? {
        
        guard index >= 0 && index < imageNames.count else { return nil }
        
        guard let contentPageVC = storyboard?.instantiateViewController(
            withIdentifier: String(describing: ImageVC.self)) as? ImageVC else { return nil }
        
        contentPageVC.currentPage = index
        contentPageVC.str = imageNames[index]
        return contentPageVC
    }
    
}
//MARK: - Extension
extension PageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ImageVC).currentPage
        pageNumber -= 1
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ImageVC).currentPage
        pageNumber += 1
        return showViewControllerAtIndex(pageNumber)
    }
}
