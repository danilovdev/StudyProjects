//
//  ProductListViewController.swift
//  HPlusSport
//
//  Created by Alexey Danilov on 12.05.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {
    
    private let session: URLSession = .shared
    
    private var products: [Product] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ShowProduct",
            let productVC = segue.destination as? ProductViewController,
            let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        
        productVC.product = products[selectedIndexPath.row]
    }
    
    private func loadProducts() {
        guard let url = URL(string: "https://hplusrsport.com/api/products") else { return }
        session.dataTask(with: url) { (data, response, error) in
            
        }
        
    }
}
