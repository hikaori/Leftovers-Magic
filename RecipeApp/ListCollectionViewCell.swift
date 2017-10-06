//
//  ListCollectionViewCell.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-02.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var listImage: UIImageView!
    @IBOutlet weak var calorieNum: UILabel!
    @IBOutlet weak var ingredientsNum: UILabel!
}
