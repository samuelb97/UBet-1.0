//
//  SideMenuHeaderViewController.swift
//  010SideMenu
//
//  Created by macmini_2 on 31/03/17.
//  Copyright © 2017 010Minds. All rights reserved.
//

import UIKit

class SideMenuHeaderViewController: UIViewController {

	@IBOutlet var headerView: UIView!
	@IBOutlet weak var label: UILabel!
    @IBOutlet weak var profileImg: UIImageView!

    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }

	func setLabel(text: String) {
		self.label.text = text
	}
    
    func setImg(image: String) {
        profileImg.image = UIImage(named: "\(image)")
        profileImg.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
