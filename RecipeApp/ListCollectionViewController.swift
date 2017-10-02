//
//  ListCollectionViewController.swift
//  RecipeApp
//
//  Created by kaori hirata on 2017-10-01.
//  Copyright © 2017 kaori hirata. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ListCollectionViewController: UICollectionViewController {
    
    let photos = ["262b4353ca25074178ead2a07cdf7dc1", "4e3281985350a2a88814608207b0b192"]
    var photoName : String!
    
    convenience init(photoName:String) {
        self.init(nibName: nil, bundle: nil)
        self.photoName = photoName
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
            
            // Cell はストーリーボードで設定したセルのID
            let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            
            // Tag番号を使ってImageViewのインスタンス生成
            let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
            // 画像配列の番号で指定された要素の名前の画像をUIImageとする
            let cellImage = UIImage(named: photos[(indexPath as NSIndexPath).row])
            // UIImageをUIImageViewのimageとして設定
            imageView.image = cellImage
            
            
            // Tag番号を使ってLabelのインスタンス生成
            let label = testCell.contentView.viewWithTag(1) as! UILabel
            label.text = photos[(indexPath as NSIndexPath).row]
            
            
            return testCell
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
