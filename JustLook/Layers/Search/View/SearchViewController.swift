//
//  SearchViewController.swift
//  JustLook
//
//  Created by Andres Aleu on 8/5/23.
//

import UIKit

class SearchViewController: UIViewController {

    
    //MARK: - IBOutlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewResultSearch: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        // Do any additional setup after loading the view.
    }

    //MARK: - setUpTableView
    func setUpTableView() {
        tableViewResultSearch.delegate = self
        tableViewResultSearch.dataSource = self
        let uiNib = UINib(nibName: String(describing: ResultSearchTableViewCell.self), bundle: nil)
        tableViewResultSearch.register(uiNib, forCellReuseIdentifier: ResultSearchTableViewCell.identifier)
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ResultSearchTableViewCell = tableView.dequeueReusableCell(withIdentifier: ResultSearchTableViewCell.identifier) as? ResultSearchTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .red
        return cell
    }
}
