//
//  PageOneViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {

    @IBOutlet weak var groupName: UITextView!
    
    @IBOutlet weak var main_view: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        // Do any additional setup after loading the view.
    }
    


}
