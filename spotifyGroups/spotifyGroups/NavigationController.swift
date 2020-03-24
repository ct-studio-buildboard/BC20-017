//
//  NavigationController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/19/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.isToolbarHidden = true
        self.navigationBar.isHidden = true
        
        //Editing the toolbar
        var items = [UIBarButtonItem]()

        //Home
//        let btn1 = UIButton(type: .custom)
//        btn1.setImage(UIImage(named: "Spotify_Icon_RGB_Green"), for: .normal)
//        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        let item1 = UIBarButtonItem(customView: btn1)
//        items.append(item1)
////        let homeButton = UIBarButtonItem(title: "Test", style: .plain, target: self, action: nil)
////        items.append(homeButton)
//
//        //Add Flexible space between buttons
//        let flexibalSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
//        items.append(flexibalSpace)
//
//        //Search
//        let searchButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: nil)
//        items.append(searchButton)
//
//        items.append(flexibalSpace)
//
//        //Your Library
//        let libraryButton = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: nil)
//        items.append(libraryButton)
//        
//        self.toolbarItems = items
        
        
        var toolBarItems = [UIBarButtonItem]()

        let systemButton1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: nil, action: nil)
        toolBarItems.append(systemButton1)

        let systemButton2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBarItems.append(systemButton2)

        let systemButton3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.trash, target: nil, action: nil)
        toolBarItems.append(systemButton3)

        self.setToolbarItems(toolBarItems, animated: true)
        self.navigationController?.isToolbarHidden = false
    }
    
    //This makes the wifi/battery status bar turn white to match the theme
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
