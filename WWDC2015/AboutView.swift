//
//  File.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/24/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//

import UIKit

class AboutView: UIView {
    var tdTitleString = "Some String"
    var titleLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
    var detailImage = UIImageView()
    
    var viewDictionary = Dictionary<String, String>()
    

    override init (frame : CGRect) {
        super.init(frame : frame)
        
        
    }
    init (frame : CGRect, num:Int, smallViewFrame:CGRect) {
        super.init(frame : frame)
        
        var index = num
        
        if let path = NSBundle.mainBundle().pathForResource("ViewsInfo", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, Array<Dictionary<String, String>>> {
                // use swift dictionary as normal
                var viewDictionary:Dictionary = dict["views"]![index]
                titleLabel = UILabel(frame: CGRectMake(self.frame.size.width/2, 0, 150, 100));
                titleLabel.font = titleLabel.font.fontWithSize(45);
                titleLabel.textAlignment = NSTextAlignment.Right
                titleLabel.text = viewDictionary["title"]
                var red:String = viewDictionary["titleRed"]!
                var blue:String = viewDictionary["titleBlue"]!
                var green:String = viewDictionary["titleGreen"]!
                titleLabel.textColor = UIColor(red: CGFloat(red.toInt()!)/255, green: CGFloat(green.toInt()!)/255, blue: CGFloat(blue.toInt()!)/255, alpha: 0.75)
                self.addSubview(titleLabel)
                if var image = UIImage(named: viewDictionary["image"]!) {
                    detailImage = UIImageView(image: UIImage(named: viewDictionary["image"]!))
                }
                detailImage.frame = CGRectMake(45, 45, 100, 100)
                //self.addSubview(detailImage)
                addSubview(titleLabel)
                addSubview(detailImage)
                
                var infoLabel = UITextView(frame: CGRectMake(0,0, 200, 300))
                    addSubview(infoLabel)
                infoLabel.text = viewDictionary["text"]!
                infoLabel.font = UIFont(name: "HelveticaNeue-Light",
                    size: 15.0)
                addSubview(infoLabel)
                
                if Int(num) == Int(1) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 50)
                    detailImage.center = CGPointMake(screenSize.width - (screenSize.width - screenSize.width * 0.25) + 75, 100)
                    infoLabel.center = CGPointMake(125 + screenSize.width - (screenSize.width - screenSize.width * 0.25), screenSize.width/2 + 200)
                }
                else if Int(num) == Int(0) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 200)
                    detailImage.center = CGPointMake(screenSize.width - (screenSize.width - screenSize.width * 0.25) + 75, 200)
                    infoLabel.center = CGPointMake(200, screenSize.width/2 + 200)
                }
                else if Int(num) == Int(2) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 50)
                    detailImage.center = CGPointMake(100, 100)
                    infoLabel.center = CGPointMake(200, screenSize.width/2 + 200)
                }
                else if Int(num) == Int(3) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 150)
                    detailImage.center = CGPointMake(100, 250)
                    infoLabel.center = CGPointMake(200, 500)
                }
                else if Int(num) == Int(4) {
                    titleLabel.center = CGPointMake(screenSize.width - 150, 0)
                    detailImage.center = CGPointMake(100, 0)
                    infoLabel.center = CGPointMake(45, screenSize.width/2 + 200)
                }
                else if Int(num) == Int(5) {
                    titleLabel.center = CGPointMake(screenSize.width - 200, 200)
                    detailImage.center = CGPointMake(30, 200)
                    infoLabel.center = CGPointMake(100, screenSize.width/2 + 300)
                    
                }
                else if Int(num) == Int(6) {
                    titleLabel.center = CGPointMake(screenSize.width - 300, 50)
                    detailImage.center = CGPointMake(100, 100)
                    infoLabel.center = CGPointMake(200, screenSize.width/2 + 200)
                }
                else if Int(num) == Int(7) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 50)
                    detailImage.center = CGPointMake(100, 100)
                    infoLabel.center = CGPointMake(200, screenSize.width/2 + 200)
                }
                else if Int(num) == Int(8) {
                    titleLabel.center = CGPointMake(screenSize.width - 100, 50)
                    detailImage.center = CGPointMake(100, 100)
                    infoLabel.center = CGPointMake(200, screenSize.width/2 + 200)
                }

            }
        }
        
        
    }
    
     convenience init () {
        self.init(frame:CGRectZero)
    }
    
    func setTDTitleString(importString:NSString) {
        tdTitleString = importString as String
        titleLabel.text = tdTitleString
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}