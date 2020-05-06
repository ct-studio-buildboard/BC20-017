//
//  HomeViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var group1: UIView!
    @IBOutlet weak var group2: UIView!
    @IBOutlet weak var recentlyplayed3: UIImageView!
    @IBOutlet weak var groups_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        groups_button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setNeedsStatusBarAppearanceUpdate()
        
        recentlyplayed3.layer.masksToBounds = false
        recentlyplayed3.layer.cornerRadius =  recentlyplayed3.frame.size.width / 2
        recentlyplayed3.clipsToBounds = true
        
        group1.layer.cornerRadius = 8
        group1.layer.masksToBounds = false
        group2.layer.cornerRadius = 8
        group2.layer.masksToBounds = false
    }
    
    @objc func buttonAction(sender: UIButton!) {
             (self.tabBarController as? ToolbarViewController)?.groupTab()
         }

    


}
