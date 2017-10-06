//
//  Data.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-09-29.
//  Copyright © 2017 kaori hirata. All rights reserved.
//testK
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

struct Recipe {
    var imageURL = String()
    var title = String()
    var recipeURL = String()
    var ingredientLines = [Any]()
    var webURL = String()
    var calories = Double()
    
    init(WithImageURL imageURL:String, title: String, recipeURL:String,ingredientLines:[Any],webURL:String, calories:Double) {
        self.imageURL = imageURL
        self.title = title
        self.recipeURL = recipeURL
        self.ingredientLines = ingredientLines
        self.webURL = webURL
        self.calories = calories
    }
}
struct RecipeSet {
    var info = [Recipe]()
}

struct SetData {
    static func getData(searchword: String,completion: @escaping ([Recipe])->()){
        //    static func getData(completion: @escaping ([Recipe])->()){
        var dataList: [Recipe] = []
        let id : String = "6c0aca51"
        let key: String = "4e8f81930e7546f41329dba38ffda943"
        let searchWord:String = searchword
        //        let searchWord:String = "chicken"
        print("searchWord\(searchWord)")
        
        Alamofire.request("https://api.edamam.com/search?q=\(searchWord)&app_id=\(id)&app_key=\(key)&from=0&to=100&").responseJSON { response in
            //            print(response.description)
            if let value = response.result.value {
                let json = JSON(value)
                
                //Getting data from json file
                for item in json["hits"].arrayValue {
                    var imageURL:String
                    var label:String
                    var recipeURL:String
                    var ingredientLines: [Any]
                    var webURL:String
                    var calories:Double
                    
                    imageURL = item["recipe"]["image"].stringValue
                    label    = item["recipe"]["label"].stringValue
                    recipeURL = item["recipe"]["url"].stringValue
                    ingredientLines = item["recipe"]["ingredientLines"].arrayValue
                    webURL   = item["recipe"]["url"].stringValue
                    calories = item["recipe"]["totalDaily"]["ENERC_KCAL"]["quantity"].doubleValue
                    
                    
                    let recipeObj = Recipe(WithImageURL: imageURL, title: label, recipeURL: recipeURL, ingredientLines: ingredientLines,webURL:webURL,calories:calories)
                    dataList.append(recipeObj)
                }
                completion(dataList)
            }
        }
    }
}
