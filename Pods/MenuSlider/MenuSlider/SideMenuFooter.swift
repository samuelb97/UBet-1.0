//
//  SideMenuFooter.swift
//  010SideMenu
//
//  Created by macmini_2 on 03/04/17.
//  Copyright © 2017 010Minds. All rights reserved.
//

import UIKit


public class SideMenuFooter: SideMenuBoxViewProtocol {
    
    var action: () -> Void

	internal func getView() -> UIView {
		fatalError("Subclasses need to implement the 'getView()' method.")
	}
    
    init(listener: @escaping (() -> Void)) {
        self.action = listener
    }

}

public class SideMenuFooterFactory {

	private var footerView: UIView!

    public static func make(title: String, action: @escaping (() -> Void)) -> SideMenuFooter {
        return SideMenuFooterSimple(title: title, listener: action)
	}



	private class SideMenuFooterSimple: SideMenuFooter {
        
        var title: String
        
        init(title : String, listener: @escaping (() -> Void)) {
            self.title = title
            super.init(listener: listener)
        }

		public override func getView() -> UIView {
			let bundleController: Bundle = Bundle(for: SideMenuFooterViewController.self)
			bundleController.loadNibNamed("SideMenuFooterViewController", owner: SideMenuFooterViewController(), options: nil)
			let sideMenuFooterView: SideMenuFooterViewController = SideMenuFooterViewController(nibName: "SideMenuFooterViewController", bundle: bundleController)
			sideMenuFooterView.loadView()
			sideMenuFooterView.setLabel(text: title)
			return sideMenuFooterView.view
		}
	}
}
