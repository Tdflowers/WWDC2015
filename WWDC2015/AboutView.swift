//
//  File.swift
//  WWDC2015
//
//  Created by Tyler Flowers on 4/24/15.
//  Copyright (c) 2015 tylerflowers. All rights reserved.
//

import Foundation
import UIKit

class AboutView: UIView {
    var tdTitleString = "Some String"
    var titleLabel = UILabel(frame: CGRectMake(0, 0, 0, 0))
    

    override init (frame : CGRect) {
        super.init(frame : frame)
        
        titleLabel = UILabel(frame: CGRectMake(0, 0, 150, 100));
        self.addSubview(titleLabel)
        
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