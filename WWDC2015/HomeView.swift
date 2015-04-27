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
    
    lazy var squarePurpleButton =  UIButton()
    lazy var squareTealButton =  UIButton()
    lazy var squareOrangeButton =  UIButton()
    lazy var squarePinkButton =  UIButton()
    
    lazy var circleYellowButton = UIButton()
    lazy var circleOrangeButton = UIButton()
    lazy var circlePinkButton = UIButton()
    lazy var circleBlueButton = UIButton()
    
    override init (frame : CGRect) {
        super.init(frame : frame)
        
        titleLabel = UILabel(frame: CGRectMake(self.frame.size.width/2, self.frame.size.height/2, 150, 100));
        
        var wwdcImageView = UIImageView(image: UIImage(named: "wwdcLogoNoCorners.png"))
        wwdcImageView.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        wwdcImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        self.addSubview(titleLabel)
        
        let circleSize:CGFloat = wwdcImageView.frame.width * 0.14;
        
        
        self.circleBlueButton = UIButton(frame: CGRectMake(self.frame.width * 0.13, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.7, circleSize, circleSize))
        circleBlueButton.setImage(UIImage(named: "blueCircle.png"), forState: UIControlState.Normal)
        circleBlueButton.addTarget(self, action: Selector("tapBlueCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleBlueButton);
        
        self.circlePinkButton = UIButton(frame: CGRectMake(self.frame.width * 0.13, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.14, circleSize, circleSize))
        circlePinkButton.setImage(UIImage(named: "pinkCircle.png"), forState: UIControlState.Normal)
        circlePinkButton.addTarget(self, action: Selector("tapPinkCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circlePinkButton);
        
        circleOrangeButton = UIButton(frame: CGRectMake(self.frame.width * 0.71, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.14, circleSize, circleSize))
        circleOrangeButton.setImage(UIImage(named: "orangeCircle.png"), forState: UIControlState.Normal)
        circleOrangeButton.addTarget(self, action: Selector("tapOrangeCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleOrangeButton);
        
        circleYellowButton = UIButton(frame: CGRectMake(self.frame.width * 0.71, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.71, circleSize, circleSize))
        circleYellowButton.setImage(UIImage(named: "yellowCircle.png"), forState: UIControlState.Normal)
        circleYellowButton.addTarget(self, action: Selector("tapYellowCircle"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(circleYellowButton);
        
        let squareSize = wwdcImageView.frame.width*0.1677
        
        
        squarePinkButton =  UIButton(frame: CGRectMake(self.frame.width * 0.41, wwdcImageView.frame.minY, squareSize, squareSize))
        squarePinkButton.setImage(UIImage(named: "pinkSquare"), forState: UIControlState.Normal);
        squarePinkButton.addTarget(self, action: Selector("tapPinkSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squarePinkButton);
        
        squareOrangeButton =  UIButton(frame: CGRectMake(self.frame.width * 0.81, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.415, squareSize, squareSize))
        squareOrangeButton.setImage(UIImage(named: "orangeSquare"), forState: UIControlState.Normal);
        squareOrangeButton.addTarget(self, action: Selector("tapOrangeSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squareOrangeButton);
        
        squareTealButton =  UIButton(frame: CGRectMake(self.frame.width * 0.41, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.826, squareSize, squareSize))
        squareTealButton.setImage(UIImage(named: "tealSquare"), forState: UIControlState.Normal);
        squareTealButton.addTarget(self, action: Selector("tapTealSquare"), forControlEvents: UIControlEvents.TouchUpInside);
        self.addSubview(squareTealButton);
        
        squarePurpleButton =  UIButton(frame: CGRectMake(self.frame.width * 0.01, wwdcImageView.frame.minY + wwdcImageView.frame.height * 0.415, squareSize, squareSize))
        squarePurpleButton.setImage(UIImage(named: "purpleSquare"), forState: UIControlState.Normal);
        squarePurpleButton.addTarget(self, action: Selector("tapPurpleSquare"), forControlEvents: UIControlEvents.TouchUpInside);

        self.addSubview(squarePurpleButton);
        
        self.addSubview(wwdcImageView)
        
        var helpText:UILabel = UILabel(frame: CGRectMake(screenSize.width * 0.15, screenSize.height/2, screenSize.width - screenSize.width * 0.3, screenSize.height - screenSize.height * 0.6))
        helpText.text = "As you can see I like to see the world in new light.\nTap the squares and circles to find out more!"
        helpText.numberOfLines = 10
        helpText.textAlignment = NSTextAlignment.Center
        helpText.lineBreakMode = NSLineBreakMode.ByWordWrapping
        helpText.textColor = UIColor.blackColor()
        helpText.alpha = 0;
        addSubview(helpText);
        
    
        
        UIView.animateWithDuration(4.0, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                wwdcImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
                
                self.circleBlueButton.frame = CGRectMake(CGFloat(15.0), screenSize.height - 20.0 - circleSize, self.circleBlueButton.frame.width, self.circleBlueButton.frame.height)
                self.circleYellowButton.frame = CGRectMake(screenSize.width - 15 - circleSize, screenSize.height - 20.0 - circleSize, self.circleYellowButton.frame.width, self.circleYellowButton.frame.height)
                self.circleOrangeButton.frame = CGRectMake(screenSize.width - 15 - circleSize, 20, self.circleOrangeButton.frame.width, self.circleOrangeButton.frame.height)
                self.circlePinkButton.frame = CGRectMake(15, 20, self.circlePinkButton.frame.width, self.circlePinkButton.frame.height)
                
                self.squarePinkButton.frame = CGRectMake(screenSize.width/2 - self.squarePinkButton.frame.width/2, 20, self.squarePinkButton.frame.width, self.squarePinkButton.frame.height)
                self.squareTealButton.frame = CGRectMake(screenSize.width/2 - self.squareTealButton.frame.width/2, screenSize.height - 20 - self.squareTealButton.frame.height, self.squareTealButton.frame.width, self.squareTealButton.frame.height);
        }) { (Bool) -> Void in
            UIView.animateWithDuration(3, animations: { () -> Void in
                wwdcImageView.center = CGPointMake(wwdcImageView.center.x, wwdcImageView.center.y - wwdcImageView.center.y * 0.4)}, completion: { (Bool) -> Void in

                    UIView.animateWithDuration(3, animations: { () -> Void in
                        helpText.alpha = 1}, completion: nil)
            })
        }

        
    }
    
    func tapPinkCircle(){
        delegate!.updateContentOffsetPosition(1);
    }
    func tapPinkSquare(){
        delegate!.updateContentOffsetPosition(2);
        if circleOrangeButton.alpha == 1 {
            circleOrangeButton.alpha = 0.20;
            circlePinkButton.alpha = 0.20;
        } else {
            circleOrangeButton.alpha = 1;
            circlePinkButton.alpha = 1;
        }
    }
    func tapOrangeCircle(){
        delegate!.updateContentOffsetPosition(3);
    }
    func tapPurpleSquare(){
        delegate!.updateContentOffsetPosition(4);
        if circleBlueButton.alpha == 1 {
            circleBlueButton.alpha = 0.20;
            circlePinkButton.alpha = 0.20;
        } else {
            circleBlueButton.alpha = 1;
            circlePinkButton.alpha = 1;
        }
    }
    func tapOrangeSquare(){
        delegate!.updateContentOffsetPosition(5);
        if circleOrangeButton.alpha == 1 {
            circleOrangeButton.alpha = 0.20;
            circleYellowButton.alpha = 0.20;
        } else {
            circleOrangeButton.alpha = 1;
            circleYellowButton.alpha = 1;
        }
    }
    func tapBlueCircle(){
        delegate!.updateContentOffsetPosition(6);
    }
    func tapTealSquare(){
        delegate!.updateContentOffsetPosition(7);
        if circleYellowButton.alpha == 1 {
            circleBlueButton.alpha = 0.20;
            circleYellowButton.alpha = 0.20;
        } else {
            circleBlueButton.alpha = 1;
            circleYellowButton.alpha = 1;
        }
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