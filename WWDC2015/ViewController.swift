//
//  ViewController.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/23/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//

import UIKit

let screenSize: CGRect = UIScreen.mainScreen().bounds

class ViewController: UIViewController, UIScrollViewDelegate, HomeViewControllerDelegate {
    
    lazy var homeScrollView = UIScrollView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.homeScrollView = UIScrollView(frame: CGRectMake(0, 0, view.frame.size.width, view.frame.size.height))
        homeScrollView.userInteractionEnabled = true
        homeScrollView.contentSize = CGSizeMake(homeScrollView.frame.width*3, homeScrollView.frame.height*3);
        homeScrollView.delegate = self
        homeScrollView.bounces = false
        homeScrollView.scrollEnabled = false
        homeScrollView.showsHorizontalScrollIndicator = false
        homeScrollView.showsVerticalScrollIndicator = false
        
        view.addSubview(homeScrollView)
        
        let screenWidthHalf = screenSize.width/2;
        let screenHeightHalf = screenSize.height/2;
        let contentSizeThirdWidth = homeScrollView.contentSize.width/3
        let contentSizeThirdHeight = homeScrollView.contentSize.height/3
        
        var frameToUse = CGRectMake(0,0,0,0)
        
        var i:Double = 0
        var y:Double = 0
        
        var num = 0
        
        for i in 0...2{
            for y in 0...2{
                var xFloat:Double = Double(i)/3.0
                var yFloat:Double = Double(y)/3.0
                var cgxFloat = CGFloat(xFloat)
                var cgyFloat = CGFloat(yFloat)
                var xPos:CGFloat = cgxFloat * (homeScrollView.contentSize.width)
                var yPos:CGFloat = cgyFloat * (homeScrollView.contentSize.height)
                if i == 1 && y==1 {
                    let homeView = HomeView(frame: CGRectMake(xPos, yPos, self.view.frame.size.width, self.view.frame.size.height))
                    homeView.delegate = self
                    homeScrollView.addSubview(homeView)
                } else {
                    let colorView = AboutView(frame: CGRectMake(xPos, yPos, self.view.frame.size.width, self.view.frame.size.height), num:num, smallViewFrame:frameToUse)
                    colorView.titleLabel.font = UIFont(name: "HelveticaNeue-Medium",
                        size: 25.0)
                    homeScrollView.addSubview(colorView)
                    num++
                }
                
            }
        }
        
        
        homeScrollView.setContentOffset(CGPointMake(homeScrollView.contentSize.width/3, homeScrollView.contentSize.height/3), animated: false)
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    
    }
    /*
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    
        
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
    */
    
    func updateContentOffsetPosition(withTag: Int) {
        let screenWidthHalf = screenSize.width/2;
        let screenHeightHalf = screenSize.height/2;
        let contentSizeThirdWidth = homeScrollView.contentSize.width/3
        let contentSizeThirdHeight = homeScrollView.contentSize.height/3
        
        switch (withTag) {
        case 1:
            if !((homeScrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) || !(self.homeScrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight) {
                self.homeScrollView.setContentOffset(CGPointMake(screenSize.width * 0.25, screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            
            break;
        case 2:
            if !(homeScrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight) {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth,screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            
            break;
        case 3:
            if !((homeScrollView.contentOffset.x + screenWidthHalf) > contentSizeThirdWidth * 2 + 10) || !(homeScrollView.contentOffset.y + screenHeightHalf <  contentSizeThirdHeight){
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2 - screenSize.width * 0.25,screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            break;
        case 4:
            if !((homeScrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) {
                self.homeScrollView.setContentOffset(CGPointMake(screenSize.width * 0.25, contentSizeThirdHeight), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            break;
        case 5:
            
            if !((homeScrollView.contentOffset.x + screenWidthHalf) > contentSizeThirdWidth*2) {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2 - screenSize.width * 0.25, contentSizeThirdHeight), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            break;
        case 6:
            
            if !((homeScrollView.contentOffset.y + screenHeightHalf) > contentSizeThirdHeight * 2) || !((homeScrollView.contentOffset.x + screenWidthHalf) < contentSizeThirdWidth) {
                self.homeScrollView.setContentOffset(CGPointMake(screenSize.width * 0.25, contentSizeThirdHeight * 2 - screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            
            break;
        case 7:
            self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight * 2 - screenSize.height * 0.15), animated: true)
            
            if !((homeScrollView.contentOffset.y + screenHeightHalf) > contentSizeThirdHeight * 2) {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight * 2 - screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            
            break;
        case 8:
            self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2 - screenSize.width * 0.25, contentSizeThirdHeight * 2 - screenSize.height * 0.15), animated: true)
            
            if !((homeScrollView.contentOffset.y + screenHeightHalf) > contentSizeThirdHeight * 2) || !((homeScrollView.contentOffset.x + screenWidthHalf) > contentSizeThirdWidth * 2) {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth * 2 - screenSize.width * 0.25, contentSizeThirdHeight * 2 - screenSize.height * 0.15), animated: true)
            } else {
                self.homeScrollView.setContentOffset(CGPointMake(contentSizeThirdWidth, contentSizeThirdHeight), animated: true)
            }
            break;
        default:
            break;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

