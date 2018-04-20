//
//  CheckButton.swift
//  CharityChecker
//
//  Created by Philip Tam on 2018-04-19.
//  Copyright © 2018 CharityDonate. All rights reserved.
//

import Foundation
import ChameleonFramework

class CheckButton : UIButton{
    
    var highlightedColor = UIColor.clear
    {
        didSet{
            if isHighlighted{
                backgroundColor = highlightedColor
                
            }
        }
    }
    
    var defaultColor = UIColor.flatSkyBlue(){
        didSet{
            if !isHighlighted{
                backgroundColor = defaultColor
            }
        }
    }
    override var isHighlighted: Bool{
        didSet{
            if isHighlighted{
                backgroundColor = highlightedColor
            }else{
                backgroundColor = defaultColor
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup(){
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        backgroundColor = defaultColor
        setTitleColor(UIColor.darkGray, for: .highlighted)
        setTitleColor(UIColor.white, for: .normal)
    }
}
