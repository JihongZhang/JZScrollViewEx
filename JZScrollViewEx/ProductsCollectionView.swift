//
//  ProductsCollectionView.swift
//  JZScrollViewEx
//
//  Created by Jihong Zhang on 12/11/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import UIKit

class ProductsCollectionView : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize = UIScreen.mainScreen().bounds
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: screenSize.width/2, height: self.view.frame.height/2)   //totally 4 cells
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        //collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collectionView!.backgroundColor = UIColor.blueColor()   //.whiteColor()
        self.view.addSubview(collectionView!)
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4  // 4 cell so far
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionCell", forIndexPath: indexPath) as CollectionViewCell
        cell.backgroundColor = UIColor.orangeColor()
        cell.textLabel.text = "Text"
        cell.imageView.image = UIImage(named: "YVE24841_1_enlarged.jpg")
        return cell
    }
    

}
