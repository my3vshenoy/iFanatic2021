//
//  ViewController.swift
//  M&MLibrary
//
//  Created by My3 Shenoy on 1/25/22.
//

import UIKit

class LibraryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK: - DataSource
extension LibraryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Library.books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        
        let book = Library.books[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.imageView?.image = book.image
        return cell
    }
}

