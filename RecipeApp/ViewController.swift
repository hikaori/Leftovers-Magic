//
//  ViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-09-27.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import SwiftyJSON

class ViewController: UIViewController {
    var datas = [Data]()
    
//    struct Data {
//        var imageURL = String()
//        var title = String()
//        var recipeURL = String()
//        var ingredientLines = [Any]()
//        
//        init(WithImageURL imageURL:String, title: String, recipeURL:String,ingredientLines:[Any]) {
//            self.imageURL = imageURL
//            self.title = title
//            self.recipeURL = recipeURL
//            self.ingredientLines = ingredientLines
//        }
//    }

    @IBOutlet weak var imgArea: UIImageView!
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        print(datas)
//        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataList = SetData.getData()
//        let fimageURL = dataList[0].imageURL
//        Alamofire.request(fimageURL).responseImage { response in
//            
//            if let image = response.result.value {
//                self.imgArea.image = image
//            }
//        }
    }


//        Alamofire.request("https://api.edamam.com/search?q=chicken&app_id=6c0aca51&app_key=4e8f81930e7546f41329dba38ffda943").responseJSON { response in
////            print("Request: \(String(describing: response.request))")   // original url request
////            print("Response: \(String(describing: response.response))") // http url response
////            print("Result: \(response.result)")                         // response serialization result
//
//            if let value = response.result.value {
//                let json = JSON(value)
//
//                //Getting data from json file
//                for item in json["hits"].arrayValue {
//                    var imageURL:String
//                    var label:String
//                    var RecipeURL:String
//                    var ingredientLines: [Any]
//                    print(item["recipe"]["image"].stringValue)
//                    imageURL = item["recipe"]["image"].stringValue
//                    label    = item["recipe"]["label"].stringValue
//                    RecipeURL = item["recipe"]["url"].stringValue
//                    ingredientLines = item["recipe"]["ingredientLines"].arrayValue
//
//
////                    print(Data(withImage: imageURL, label: label,ingredientLines: ingredientLines))
//                    print(Data(WithImageURL: imageURL, title: label, recipeURL: RecipeURL,ingredientLines: ingredientLines))
//                    self.datas.append(Data(WithImageURL: imageURL, title: label, recipeURL: RecipeURL,ingredientLines: ingredientLines))
//
//                }
//                let fimageURL = self.datas[0].imageURL
//                Alamofire.request(fimageURL).responseImage { response in
//
//                    if let image = response.result.value {
//                        self.imgArea.image = image
//                    }
//                }
//            }
//        }

//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


