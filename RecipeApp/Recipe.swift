//
//  Data.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-09-29.
//  Copyright © 2017 kaori hirata. All rights reserved.
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
    
    init(WithImageURL imageURL:String, title: String, recipeURL:String,ingredientLines:[Any]) {
        self.imageURL = imageURL
        self.title = title
        self.recipeURL = recipeURL
        self.ingredientLines = ingredientLines
    }
}

struct SetData {
    
    //{ (parameters) -> return type in statements}
    
    static func getData(completion: @escaping ([Recipe])->()) {
        var dataList: [Recipe] = []
        let id : String = "6c0aca51"
        let key: String = "4e8f81930e7546f41329dba38ffda943"
        let searchWord:String = "chicken"
        
        Alamofire.request("https://api.edamam.com/search?q=\(searchWord)&app_id=\(id)&app_key=\(key)").responseJSON { response in
            
            if let value = response.result.value {
                let json = JSON(value)
                
                //Getting data from json file
                for item in json["hits"].arrayValue {
                    var imageURL:String
                    var label:String
                    var recipeURL:String
                    var ingredientLines: [Any]
//                    print(item["recipe"]["image"].stringValue)
                    imageURL = item["recipe"]["image"].stringValue
                    label    = item["recipe"]["label"].stringValue
                    recipeURL = item["recipe"]["url"].stringValue
                    ingredientLines = item["recipe"]["ingredientLines"].arrayValue
                    
                    let recipeObj = Recipe(WithImageURL: imageURL, title: label, recipeURL: recipeURL, ingredientLines: ingredientLines)
                    dataList.append(recipeObj)
                }
                
                completion(dataList)
            }
        }
    }
}

