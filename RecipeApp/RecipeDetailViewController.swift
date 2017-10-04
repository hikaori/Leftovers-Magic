//
//  RecipeDetailViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-03.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var recipeDetailTitle: UILabel!
    @IBOutlet weak var recipeDetailPic: UIImageView!
    var recipe = Recipe(WithImageURL: "", title: "", recipeURL: "", ingredientLines: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
