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
    var recipies: [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataList = SetData.getData { (recData) in
            
            self.recipies = recData
            print(self.recipies.count)
            print(self.recipies[0])
        }
//        print(recipies[0])
        
        self.searchField.delegate = self

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
