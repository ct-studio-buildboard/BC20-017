//
//  HomeViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var playlist6: UIView!
    @IBOutlet weak var playlist5: UIView!
    @IBOutlet weak var playlist4: UIView!
    @IBOutlet weak var playlist3: UIView!
    @IBOutlet weak var playlist2: UIView!
    @IBOutlet weak var playlist1: UIView!
    @IBOutlet weak var groupsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        groupsButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setNeedsStatusBarAppearanceUpdate()
    }
    @objc func buttonAction(sender: UIButton!) {
          (self.tabBarController as? ToolbarViewController)?.groupTab()
      }


}
