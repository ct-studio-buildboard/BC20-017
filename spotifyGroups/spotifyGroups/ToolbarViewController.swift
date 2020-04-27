//
//  ToolbarViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class ToolbarViewController: UITabBarController {
    @IBOutlet weak var toolBar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "CircularStd-Book", size: 11)!], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "CircularStd-Book", size: 11)!], for: .selected)
        UITabBar.appearance().tintColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        // Do any additional setup after loading the view.
        
        
    }
    
    func groupTab() {
        self.selectedIndex = 2
    }
    
    func popInvite() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "invitePop") as! InviteViewController
        vc.providesPresentationContextTransitionStyle = true
        vc.definesPresentationContext = true
        vc.modalPresentationStyle = UIModalPresentationStyle.overFullScreen;
        //audioPlayer.play()
        self.present(vc, animated: true, completion: nil)
    }
 
}
