//
//  ProductDetailViewController.swift
//  JZScrollViewEx
//
//  Created by Jihong Zhang on 12/10/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    let margin : CGFloat = 8
    let toolBarHeight : CGFloat = 46
    let buttonHeight : CGFloat = 40
    let navigationHeight : CGFloat = 55
    let buttonArrowHeight :  CGFloat = 30
    let labelHeight : CGFloat = 25
    
    //screen size related
    var screenWidth : CGFloat?
    var screenHeight : CGFloat?
    var scrollviewProductDetailAllHeight : CGFloat?
    var scrollviewProductDetailImageHeight : CGFloat?
    
    //TODO: need to dynamically get it
    var numOfImage : CGFloat = 4.0
    let similarImages : Int = 4
    
    let scrollviewProductDetailAll = UIScrollView(frame: UIScreen.mainScreen().bounds)
    let scrollviewProductDetailImage = UIScrollView(frame: UIScreen.mainScreen().bounds)
    //let collectionviewSimilarProducts : ProductsCollectionView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width as CGFloat
        screenHeight = screenSize.height as CGFloat
        scrollviewProductDetailAllHeight = screenSize.height * 3 as CGFloat
        scrollviewProductDetailImageHeight = screenSize.height * 0.6 as CGFloat
        
        // setup the scroll view
        self.scrollviewProductDetailAll.frame = CGRectMake(0, 0, screenWidth!, scrollviewProductDetailAllHeight!)
        self.scrollviewProductDetailAll.contentSize = CGSize(width:screenWidth!, height:scrollviewProductDetailAllHeight!)
        self.scrollviewProductDetailAll.backgroundColor = UIColor.purpleColor()
        
        self.scrollviewProductDetailImage.frame = CGRectMake(0, 0, screenWidth!, scrollviewProductDetailImageHeight!)
        self.scrollviewProductDetailImage.contentSize = CGSize(width:screenWidth!, height:scrollviewProductDetailImageHeight! * self.numOfImage)
        self.scrollviewProductDetailImage.backgroundColor = UIColor.redColor()
        self.scrollviewProductDetailAll.addSubview(self.scrollviewProductDetailImage)
        
        //TODO: dynamically calculate the # of images
        let image0 : UIImage? = UIImage(named: "img_dlp_dress1")! as UIImage
        let image1 : UIImage? = UIImage(named: "img_dlp_dress2")! as UIImage
        let image2 : UIImage? = UIImage(named: "img_dlp_dress3")! as UIImage
        let image3 : UIImage? = UIImage(named: "img_dlp_dress4")! as UIImage
    
        let imageView0 : UIImageView? = UIImageView(frame:CGRectMake(0, 0, screenWidth!, scrollviewProductDetailImageHeight!))   //UIImageView(image: image0)
        imageView0?.contentMode = .ScaleAspectFill //.Center //  .ScaleAspectFit
        imageView0?.image = image0
        self.scrollviewProductDetailImage.addSubview(imageView0!)
        let imageView1 : UIImageView? = UIImageView(frame:CGRectMake(0, scrollviewProductDetailImageHeight!, screenWidth!, scrollviewProductDetailImageHeight!))
        imageView1?.image = image1
        self.scrollviewProductDetailImage.addSubview(imageView1!)
        let imageView2 : UIImageView? = UIImageView(frame:CGRectMake(0, scrollviewProductDetailImageHeight! * 2, screenWidth!, scrollviewProductDetailImageHeight!))
        imageView2?.image = image2
        self.scrollviewProductDetailImage.addSubview(imageView2!)
        let imageView3 : UIImageView? = UIImageView(frame:CGRectMake(0, scrollviewProductDetailImageHeight! * 3, screenWidth!, scrollviewProductDetailImageHeight!))
        imageView3?.image = image3
        self.scrollviewProductDetailImage.addSubview(imageView3!)
        
        
        
        //product name
        var labelY = scrollviewProductDetailImageHeight!+margin
        var frame = CGRectMake(0, labelY, screenWidth!, labelHeight)
        var labelName = UILabel(frame: frame)
        labelName.textAlignment = NSTextAlignment.Center
        labelName.text = "Valetino Polka Dot Dress"
        labelName.font = UIFont.boldSystemFontOfSize(18.0)  //UIFont(name:"HelveticaNeue-Bold", size: 25.0)
        self.scrollviewProductDetailAll.addSubview(labelName)
        
        //price & size label
        labelY += labelHeight
        frame = CGRectMake(0, labelY, screenWidth!, labelHeight)
        var labelPrice = UILabel(frame: frame)
        labelPrice.textAlignment = NSTextAlignment.Center
        labelPrice.text = "$375.00 | S | US 4"
        labelPrice.textColor = UIColor.grayColor()
        labelPrice.font = UIFont.systemFontOfSize(18.0)
        self.scrollviewProductDetailAll.addSubview(labelPrice)
        
        //wasRetailPrice
        labelY += labelHeight
        frame = CGRectMake(0, labelY, screenWidth!, labelHeight)
        var labelwasRetailPrice = UILabel(frame: frame)
        labelwasRetailPrice.textAlignment = NSTextAlignment.Center
        labelwasRetailPrice.text = "Est. Retail $1000"
        labelwasRetailPrice.textColor = UIColor.grayColor()
        labelwasRetailPrice.font = UIFont.systemFontOfSize(14.0)
        self.scrollviewProductDetailAll.addSubview(labelwasRetailPrice)

        
        //add detail button
        let buttonProductDetailY = screenHeight!-toolBarHeight-navigationHeight-buttonHeight-margin*2 - buttonArrowHeight
        let buttonProductDetail =  UIButton.buttonWithType(UIButtonType.System) as UIButton
        buttonProductDetail.frame = CGRectMake(screenWidth!/4, buttonProductDetailY, screenWidth!/2, buttonArrowHeight)
        buttonProductDetail.backgroundColor = UIColor.clearColor()
        //buttonProductDetail.setTitle("⌃", forState: UIControlState.Normal)
        let backgroundImage = UIImage(named: "arrow-up-128.png") as UIImage?
        //buttonProductDetail.setBackgroundImage(backgroundImage, forState: UIControlState.Normal)
        buttonProductDetail.setImage(backgroundImage, forState: UIControlState.Normal)
        buttonProductDetail.addTarget(self, action: "buttonProductDetailClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.scrollviewProductDetailAll.addSubview(buttonProductDetail)
        

        
        //add to bag button
        let buttonAddToBagY = buttonProductDetailY - buttonArrowHeight - margin //screenHeight-toolBarHeight-navigationHeight-buttonHeight-margin
        let buttonAddToBag =  UIButton.buttonWithType(UIButtonType.System) as UIButton
        buttonAddToBag.frame = CGRectMake(margin, screenHeight!-toolBarHeight-navigationHeight-buttonHeight-margin, screenWidth! - self.margin*2, buttonHeight)
        buttonAddToBag.backgroundColor = UIColor.redColor()
        buttonAddToBag.setTitle("ADD TO BAG", forState: UIControlState.Normal)
        buttonAddToBag.addTarget(self, action: "buttonAddToBagClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.scrollviewProductDetailAll.addSubview(buttonAddToBag)
 
        
        //add colectionview for similar products
        let viewcontrollerCollectionviewHolder = UIView(frame: CGRectMake(100, 200, 100, 100))
        let collectionviewSimilarProducts = ProductsCollectionView()
        viewcontrollerCollectionviewHolder.addSubview(collectionviewSimilarProducts);   //?????? failed here
        self.scrollviewProductDetailAll.addSubview(viewcontrollerCollectionviewHolder)
        
        
        self.view = self.scrollviewProductDetailAll
        
    }
    
    func buttonAddToBagClicked(sender: UIButton) {
        println("buttonAddToBagClicked");
    }
    
    func buttonProductDetailClicked(sender: UIButton) {
        println("buttonSimilarProductsClicked");
        
        self.scrollviewProductDetailAll.contentOffset = CGPointMake(0, self.screenHeight! - self.toolBarHeight - self.navigationHeight*2 - self.labelHeight);
    }
    
    
}

