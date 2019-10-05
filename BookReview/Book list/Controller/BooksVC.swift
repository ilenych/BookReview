//
//  BooksTableViewController.swift
//  BookReview
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import UIKit

fileprivate protocol FilterBooks {
    func filterBooks(_ searchText: String, scope: String)
}

class BooksVC: UITableViewController, FilterBooks {
    
    //MARK: - Variables
    var books = [Books]()
    var filteredBooks = [Books]()
    let searchController = UISearchController(searchResultsController: nil)
    fileprivate let scopeButtonTitles: [String] = ["All", "Drama", "Fantasy", "Horror", "Other"]
    
    //MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LocalService.fethData { (books) in
            self.books = books
        }
        
        setupSeacrhController()
        
        tableView.register(UINib(nibName: "BooksTVC", bundle: nil), forCellReuseIdentifier: BooksTVC.reuseId)
        tableView.tableFooterView = UIView()
    }
    
    //MARK: -  Functions
    fileprivate func setupSeacrhController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = scopeButtonTitles
        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = #colorLiteral(red: 0.7139567137, green: 0.1102785543, blue: 0, alpha: 1)
        navigationItem.searchController = searchController 
        navigationItem.searchController?.isActive = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    func filterBooks(_ searchText: String, scope: String = "All") {
        filteredBooks = books.filter { book in
            if !(book.category == scope) && scope != "All" {
                return false
            }
            return book.name.lowercased().contains(searchText.lowercased()) || searchText == ""
        }
        tableView.reloadData()
    }
    
    //MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredBooks.count
        }
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BooksTVC.reuseId, for: indexPath) as! BooksTVC
        let book: Books

        if searchController.isActive {
            book = filteredBooks[indexPath.row]
        } else {
            book = books[indexPath.row]
        }

        cell.nameLabel.text = book.name
        cell.categoryLabel.text = book.category
        cell.iconImageView.image = UIImage(named: book.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: String(describing: DescriptionVC.self), sender: nil)
    }
    
    //MARK: - Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: DescriptionVC.self) {
            if let indexpath = tableView.indexPathForSelectedRow {
                let book: Books
                if searchController.isActive {
                    book = filteredBooks[indexpath.row]
                } else {
                    book = books[indexpath.row]
                }
                let descriptionVC = segue.destination as! DescriptionVC
                descriptionVC.collectionImages = book.collectionImages
                descriptionVC.set(name: book.name, image: book.image, description: book.description)
            }
        }
    }
}

//MARK: Extension
extension BooksVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        filterBooks(searchController.searchBar.text!, scope: scope)
    }
}

extension BooksVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterBooks(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}
