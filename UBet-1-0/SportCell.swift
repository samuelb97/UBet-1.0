//
//  SportCell.swift
//  UBet-1-0
//
//  Created by Sam Boley on 6/14/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit

class SportCell: UITableViewCell {
    
    @IBOutlet weak var Team1Name: UILabel!
    @IBOutlet weak var Team1Record: UILabel!
    @IBOutlet weak var Score1: UILabel!
    @IBOutlet weak var Team1Img: UIImageView!
    
    @IBOutlet weak var Team2Name: UILabel!
    @IBOutlet weak var Team2Record: UILabel!
    @IBOutlet weak var Score2: UILabel!
    @IBOutlet weak var Team2Img: UIImageView!

    @IBOutlet weak var TimeStamp: UILabel!
    @IBOutlet weak var LiveTime: UILabel!
    
    @IBAction func Team1Tapped(_ sender: Any) {
    }
    
    @IBAction func Team2Tapped(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
