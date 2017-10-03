//
//  SearchViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-01.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchField.delegate = self
        
    }
//    func buttonClick(sender: UIButton){
//        //getting input from Text Field
//        searchWord = searchField.text!
//        
//    }
    
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
