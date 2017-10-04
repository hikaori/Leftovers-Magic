//
//  RecipeDetailViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-03.
//  Copyright © 2017 kaori hirata. All rights reserved.
// git branch real test 

import UIKit
import Alamofire
import AlamofireImage

class RecipeDetailViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var ingredientTableView: UITableView!
    
    //UIViewController,
    @IBOutlet weak var recipeDetailTitle: UILabel!
    @IBOutlet weak var recipeDetailPic: UIImageView!
    var recipe = Recipe(WithImageURL: "", title: "", recipeURL: "", ingredientLines: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set RecipeTitel
        recipeDetailTitle.text = self.recipe.title
        
        // set Image
        Alamofire.request(self.recipe.imageURL).responseImage { response in
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self.recipeDetailPic.image = image
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // ingredient tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return recipe.ingredientLines.count
    }
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int{
        return recipe.ingredientLines.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient")!
                let text = recipe.ingredientLines[indexPath.row]
                print("text\(text)")
//                ingredientLabel.text = String(describing: text)
//                cell.textLabel?.text = ingredientLabel.text
                return cell
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return recipe.ingredientLines.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient")!
//        let text = recipe.ingredientLines[indexPath.row]
//        print("text\(text)")
//        cell.textLabel?.text = String(describing: text)
//        return cell
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        // your cell coding
//        return UITableViewCell()
//    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        // cell selected code here
//    }
}
