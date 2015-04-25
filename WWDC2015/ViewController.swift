//
//  ViewController.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/23/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.mainScreen().bounds

class ViewController: UIViewController, UIScrollViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let scrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.size.width, view.frame.size.height))
        scrollView.userInteractionEnabled = true
        scrollView.contentSize = CGSizeMake(scrollView.frame.width*3, scrollView.frame.height*3);
        scrollView.delegate = self
        scrollView.bounces = false
        ;
        
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
                let colorView = AboutView(frame: CGRectMake(xPos, yPos, self.view.frame.size.width, self.view.frame.size.height))
                colorView.backgroundColor = getRandomColor()
                colorView.setTDTitleString("\(i), \(y)");
                scrollView.addSubview(colorView)
            }
        }
        
        
        scrollView.setContentOffset(CGPointMake(scrollView.contentSize.width/3, scrollView.contentSize.height/3), animated: false)
        
    }
    
    func getRandomColor() -> UIColor{
        
        
        var randomRed:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        var randomGreen:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        var randomBlue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let screenWidthHalf = screenSize.width/2;
        let screenHeightHalf = screenSize.height/2;
        
        let contentSizeThirdWidth = scrollView.contentSize.width/3
        let contentSizeThirdHeight = scrollView.contentSize.height/3
        
        
        if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight) {
            println("Upper left")
            
            scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth * 2) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight) {
            println("upper middle ")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, 0), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth * 3) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight) {
            println("upper right ")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2, 0), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight * 2) {
            println("Middle left")
            scrollView.setContentOffset(CGPointMake(0, contentSizeThirdHeight), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth * 2) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight * 2) {
            println("Middle ")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth * 3) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight * 2) {
            println("Middle right")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2, contentSizeThirdHeight), animated: true)
        }
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight * 3) {
            println("bottom left")
            scrollView.setContentOffset(CGPointMake(0, contentSizeThirdHeight * 2), animated: true)
        }
            
        else if ((scrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth * 2) && (scrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight * 3) {
            println("bottom middle")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight * 2), animated: true)
        }
        else {
            println("bottom right")
            scrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2, contentSizeThirdHeight * 2), animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

