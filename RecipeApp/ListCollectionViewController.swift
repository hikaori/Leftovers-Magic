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
    var recipes: [Recipe] = []
    
    convenience init(recipies:[Recipe]) {
        self.init(nibName: nil, bundle: nil)
        self.recipes = recipies
        print("ListCVCinit")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ListCVCLoad")
        SetData.getData { (recData) in
            self.recipes = recData

            self.collectionView?.reloadData() // this method need to refresh data
            print("number\(self.recipes.count)")
        }
    }
    
    // how many picture
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("recipies.count\(recipes.count)")
        return recipes.count
    }
    
    // set each cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionViewCell
        
        cell.listLabel.text = recipes[indexPath.row].title
        let recipePicURL = recipes[indexPath.row].imageURL
        Alamofire.request(recipePicURL).responseImage { response in
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                cell.listImage.image = image
            }
        }
        return cell
    }

}
