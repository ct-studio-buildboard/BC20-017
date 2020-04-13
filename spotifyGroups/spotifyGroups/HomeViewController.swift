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
