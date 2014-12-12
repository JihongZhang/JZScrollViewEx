//
//  ViewController.swift
//  JZScrollViewEx
//
//  Created by Jihong Zhang on 12/10/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var getDetailView:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let nextItem = UIBarButtonItem(title: "Detail", style:.Plain, target: self, action: "goToProductDetailPage");
        
        self.navigationItem.rightBarButtonItem = nextItem;
        self.navigationItem.title = "First Page";
        
        
        
        let button   = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(100, 100, 200, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Get Product Detail", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(button)
    }
    
    func buttonAction(sender:UIButton!)
    {
        println("Button tapped")
        goToProductDetailPage()
        
    }
    
    func goToProductDetailPage() {
        NSLog("goToNextPage clicked");
        let svc = ProductDetailViewController()
        self.navigationController?.pushViewController(svc, animated: true);
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

