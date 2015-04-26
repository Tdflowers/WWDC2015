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
    init (frame : CGRect, num:Int) {
        super.init(frame : frame)
        
        var index = num
        
        if let path = NSBundle.mainBundle().pathForResource("ViewsInfo", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, Array<Dictionary<String, String>>> {
                // use swift dictionary as normal
                var viewDictionary:Dictionary = dict["views"]![index]
                println(viewDictionary)
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
                self.addSubview(detailImage)

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