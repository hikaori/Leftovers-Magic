//
//  SearchViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-01.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataList = SetData.getData()
        
        self.searchField.delegate = self as! UITextFieldDelegate

        searchButton.addTarget(self, action: #selector(showList), for: .touchUpInside)
    }
    
    func showList(){
        let listCVC = ListCollectionViewController.init(photoName: "photolist")
        listCVC.view.backgroundColor = UIColor.red
        self.navigationController?.pushViewController(listCVC, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// For close keyboard
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.resignFirstResponder()
        return true
    }
}
