//
//  RecipeDetailViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-03.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class RecipeDetailViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var detailingNum: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    //UIViewController,
    @IBOutlet weak var recipeDetailTitle: UILabel!
    @IBOutlet weak var recipeDetailPic: UIImageView!
    var recipe = Recipe(WithImageURL: "", title: "", recipeURL: "", ingredientLines: [], webURL:"" ,calories:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set Image
        Alamofire.request(self.recipe.imageURL).responseImage { response in
            
            if let image = response.result.value {
                self.recipeDetailPic.image = image
            }
        }
        
        //set RecipeTitel
        recipeDetailTitle.text = self.recipe.title
        
        //set Ingredient Number
        detailingNum.text = String(self.recipe.ingredientLines.count)
        
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
    }
    
    // ingredient tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return recipe.ingredientLines.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient")!
                let text = recipe.ingredientLines[indexPath.row]
                let setText = String(describing: text)
                cell.textLabel?.text = setText
                return cell
    }
    
    // pass the data(webURL) to next view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebSiteSegue" {
            let destViewController = segue.destination as! WebSiteViewController
            let url = recipe.webURL
            destViewController.webURL = url
        }
    }
}
