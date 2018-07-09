//
//  FBButton.swift
//  UBet-1-0
//
//  Created by Sam Boley on 7/9/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit

class FBButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageView?.contentMode = .scaleAspectFit
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        //Makes View a Circle
        layer.cornerRadius = self.frame.width / 2
    }


}
