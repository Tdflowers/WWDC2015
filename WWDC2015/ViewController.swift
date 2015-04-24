//
//  ViewController.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/23/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.size.width, view.frame.size.height))
        scrollView.userInteractionEnabled = true
        scrollView.contentSize = CGSizeMake(scrollView.frame.width*3, scrollView.frame.height*3);
        scrollView.delegate = self
        scrollView.bounces = false
        
        view.addSubview(scrollView)
        var i:Double = 0
        var y:Double = 0
        
        for i in 0...2{
            for y in 0...2{
                var xFloat:Double = Double(i)/3.0
                var yFloat:Double = Double(y)/3.0
                var cgxFloat = CGFloat(xFloat)
                var cgyFloat = CGFloat(yFloat)
                var xPos:CGFloat = cgxFloat * (scrollView.contentSize.width)
                var yPos:CGFloat = cgyFloat * (scrollView.contentSize.height)
                let colorView = UIView(frame: CGRectMake(xPos, yPos, self.view.frame.size.width, self.view.frame.size.height))
                colorView.backgroundColor = getRandomColor()
                scrollView.addSubview(colorView)
            }
        }
        
        
        scrollView.setContentOffset(CGPointMake(scrollView.contentSize.width/3, scrollView.contentSize.height/3), animated: false)
        
    }
    
    func getRandomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        
        var randomGreen:CGFloat = CGFloat(drand48())
        
        var randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        println(scrollView.contentOffset)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

