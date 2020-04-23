//
//  HomeViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 3/24/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var main_scroll: UIScrollView!
    @IBOutlet weak var top_groups: UIScrollView!
    @IBOutlet weak var top_podcasts: UIScrollView!
    @IBOutlet weak var recently_played: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        main_scroll.showsVerticalScrollIndicator = false
        top_podcasts.showsHorizontalScrollIndicator = false
        top_groups.showsHorizontalScrollIndicator = false
        recently_played.showsHorizontalScrollIndicator = false
        setNeedsStatusBarAppearanceUpdate()
    }
    


}
