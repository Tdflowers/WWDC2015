//
//  HomeView.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/25/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//
import UIKit

protocol HomeViewControllerDelegate{
    func updateContentOffsetPosition(withTag:Int)
}

class HomeView: UIView {
    var titleLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
    
    var delegate:HomeViewControllerDelegate! = nil

    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        titleLabel = UILabel(frame: CGRectMake(self.frame.size.width/2, self.frame.size.height/2, 150, 100));
        
        var wwdcImageView = UIImageView(image: UIImage(named: "wwdcLogoNoCorners.png"))
        wwdcImageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        wwdcImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.addSubview(titleLabel)
        
        let circleSize:CGFloat = wwdcImageView.frame.width * 0.14;
        
        
        var circleBlueButton = UIButton(frame: CGRectMake(self.frame.width * 0.13, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.7, circleSize, circleSize))
        circleBlueButton.setImage(UIImage(named: "blueCircle.png"), forState: UIControlState.Normal)
        circleBlueButton.addTarget(self, action: Selector("tapBlueCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleBlueButton);
        
        var circlePinkButton = UIButton(frame: CGRectMake(self.frame.width * 0.13, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.14, circleSize, circleSize))
        circlePinkButton.setImage(UIImage(named: "pinkCircle.png"), forState: UIControlState.Normal)
        circlePinkButton.addTarget(self, action: Selector("tapPinkCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circlePinkButton);
        
        var circleOrangeButton = UIButton(frame: CGRectMake(self.frame.width * 0.71, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.14, circleSize, circleSize))
        circleOrangeButton.setImage(UIImage(named: "orangeCircle.png"), forState: UIControlState.Normal)
        circleOrangeButton.addTarget(self, action: Selector("tapOrangeCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleOrangeButton);
        
        var circleYellowButton = UIButton(frame: CGRectMake(self.frame.width * 0.71, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.71, circleSize, circleSize))
        circleYellowButton.setImage(UIImage(named: "yellowCircle.png"), forState: UIControlState.Normal)
        circleYellowButton.addTarget(self, action: Selector("tapYellowCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleYellowButton);
        
        let squareSize = wwdcImageView.frame.width*0.1677
        
        
        var squarePinkButton =  UIButton(frame: CGRectMake(self.frame.width * 0.41, wwdcImageView.frame.minY, squareSize, squareSize))
        squarePinkButton.setImage(UIImage(named: "pinkSquare"), forState: UIControlState.Normal);
        squarePinkButton.addTarget(self, action: Selector("tapPinkSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squarePinkButton);
        
        var squareOrangeButton =  UIButton(frame: CGRectMake(self.frame.width * 0.82, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.415, squareSize, squareSize))
        squareOrangeButton.setImage(UIImage(named: "orangeSquare"), forState: UIControlState.Normal);
        squareOrangeButton.addTarget(self, action: Selector("tapOrangeSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squareOrangeButton);
        
        var squareTealButton =  UIButton(frame: CGRectMake(self.frame.width * 0.41, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.826, squareSize, squareSize))
        squareTealButton.setImage(UIImage(named: "tealSquare"), forState: UIControlState.Normal);
        squareTealButton.addTarget(self, action: Selector("tapTealSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squareTealButton);
        
        var squarePurpleButton =  UIButton(frame: CGRectMake(0.0, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.415, squareSize, squareSize))
        squarePurpleButton.setImage(UIImage(named: "purpleSquare"), forState: UIControlState.Normal);
        squarePurpleButton.addTarget(self, action: Selector("tapPurpleSquare"), forControlEvents: UIControlEvents.TouchUpInside);

        self.addSubview(squarePurpleButton);
        
        self.addSubview(wwdcImageView)

        
        UIView.animateWithDuration(4.0, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            wwdcImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
            circleBlueButton.frame = CGRectMake(CGFloat(15.0), screenSize.height - 20.0 - circleSize, circleBlueButton.frame.width, circleBlueButton.frame.height)
            circleYellowButton.frame = CGRectMake(screenSize.width - 15 - circleSize, screenSize.height - 20.0 - circleSize, circleYellowButton.frame.width, circleYellowButton.frame.height)
            circleOrangeButton.frame = CGRectMake(screenSize.width - 15 - circleSize, 20, circleOrangeButton.frame.width, circleOrangeButton.frame.height)
            circlePinkButton.frame = CGRectMake(15, 20, circlePinkButton.frame.width, circlePinkButton.frame.height)
            
            squarePinkButton.frame = CGRectMake(screenSize.width/2 - squarePinkButton.frame.width/2, 20, squarePinkButton.frame.width, squarePinkButton.frame.height)
            squareTealButton.frame = CGRectMake(screenSize.width/2 - squareTealButton.frame.width/2, screenSize.height - 20 - squareTealButton.frame.height, squareTealButton.frame.width, squareTealButton.frame.height);
        }, completion: nil)

        
    }
    
    func tapPinkCircle(){
        delegate!.updateContentOffsetPosition(1);
    }
    func tapPinkSquare(){
        delegate!.updateContentOffsetPosition(2);
    }
    func tapOrangeCircle(){
        delegate!.updateContentOffsetPosition(3);
    }
    func tapPurpleSquare(){
        delegate!.updateContentOffsetPosition(4);
    }
    func tapOrangeSquare(){
        delegate!.updateContentOffsetPosition(5);
    }
    func tapBlueCircle(){
        delegate!.updateContentOffsetPosition(6);
    }
    func tapTealSquare(){
        delegate!.updateContentOffsetPosition(7);
    }
    func tapYellowCircle(){
        delegate!.updateContentOffsetPosition(8);
    }


    
    
    convenience init () {
        self.init(frame:CGRectZero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}