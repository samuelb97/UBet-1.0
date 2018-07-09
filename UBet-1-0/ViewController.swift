//
//  ViewController.swift
//  UBet-1-0
//
//  Created by Sam Boley on 6/10/18.
//  Copyright © 2018 Sam Boley. All rights reserved.
//

import UIKit
import MenuSlider

class ViewController: UIViewController, SideMenuDelegate {
    
    
    
    var menu: SideMenuViewController!
    
    @IBAction func MenuBtnPressed(_ sender: Any) {
        menu.expand(onController: self)
    }
  
/*    @IBAction func openMenu(_ sender: Any) {
        // call the menu method expand(*controller*) to open
        menu.expand(onController: self)
    }
    */
    // Optionally function onMenuClose(), fired when user closes menu
    func onMenuClose() {
        print("Action on Close Menu")
    }
    
    // Optionally function onMenuClose(), fired when user open menu
    func onMenuOpen() {
        print("Action on Open Menu")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Creating a Menu Item with title string, with an action
        let menuItem1: SideMenuItem = SideMenuItemFactory.make(title: "NBA") {
            
            
            print("NBA Called")
        }
        
        // Creating a Menu Item with title string, with an action
        let menuItem2 = SideMenuItemFactory.make(title: "NFL") {
            
            
            print("NFL Called")
        }
        
        let menuItem3 = SideMenuItemFactory.make(title: "NHL") {
            
            
            print("NHL Called")
        }
        
        let menuItem4 = SideMenuItemFactory.make(title: "MLB") {
            
            
            print("MLB Called")
        }
        
        let menuItem5 = SideMenuItemFactory.make(title: "Friends") {
            
            
            print("Friends Called")
        }
        
        // Creating a Menu Header with title string
        let menuheader = SideMenuHeaderFactory.make(title: "Samuel Boley", image: "profileImg")
        
//        let footerLabel = UILabel()
//        footerLabel.text = "Footer"
//        footerLabel.textAlignment = NSTextAlignment.center
//        footerLabel.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        let footerView: UIView = UIView()
//        footerLabel.frame = footerView.frame
//        footerView.addSubview(footerLabel)
//        footerView.backgroundColor = UIColor.gray
        
        // Creating a Menu Footer with an UIView
        let menufooter = SideMenuFooterFactory.make(title: "Nil"){
            
            print("Settings Called")
        }
        
        // Setting items to the SideMenuViewController
        let menuBuild = SideMenu(menuItems: [menuItem1, menuItem2, menuItem3, menuItem4, menuItem5], header: menuheader,
                                 footer: menufooter)
        
        // Building the Menu SideMenuViewController
        self.menu = menuBuild.build()
        
        // Finally, setting self class for MenuController Delegate
        menu.delegate = self
    }
    
}


