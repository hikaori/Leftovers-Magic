//
//  ListCollectionViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-02.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class ListCollectionViewController: UICollectionViewController {
    @IBOutlet var loading: UIActivityIndicatorView!
    var recipes: [Recipe] = []
    var searchWord = String()
//    var selectedRecipe = Recipe(WithImageURL: "", title: "", recipeURL: "", ingredientLines: [])

    
    convenience init(recipies:[Recipe]) {
        self.init(nibName: nil, bundle: nil)
        self.recipes = recipies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loading activity
        loading.startAnimating()
        self.view.addSubview(loading)
        
//        print("text\(searchWord)")
        SetData.getData(searchword: searchWord) { (recData) in
            self.recipes = recData

            self.collectionView?.reloadData() // this method need to refresh data
            print("number\(self.recipes.count)")
            
            // after get recipes loading hid
            self.loading.isHidden = true
        }
    }
    
    // set the number of list
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("recipies.count\(recipes.count)")
        return recipes.count
    }
    
    // set each cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionViewCell
        
        //set recipe Title
        cell.listLabel.text = recipes[indexPath.row].title
        
        //set recipe Image
        let recipePicURL = recipes[indexPath.row].imageURL
        Alamofire.request(recipePicURL).responseImage { response in
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                cell.listImage.image = image
            }
        }
        
        //set recipe caloriy
        let recipeCalories = recipes[indexPath.row].calories
        cell.listCalNum.text = String(recipeCalories)
        
        //set recipe ingredients Number
        let ingredientsNum = recipes[indexPath.row].ingredientLines.count
        cell.listIngNum.text = String(ingredientsNum)
        return cell
    }
    
    // pass the data to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedRecipeSegue" {
            let destViewController = segue.destination as! RecipeDetailViewController
            let recipe = recipes[(collectionView?.indexPathsForSelectedItems?.first?.row)!] // first value of recipes which is imageURL. row is the selected one
            destViewController.recipe = recipe
        }
    }

}
