//
//  createGroupContainerViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class createGroupContainerViewController: UIViewController {

    @IBOutlet weak var create_group_label_view: UIView!
    @IBOutlet weak var settings: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        create_group_label_view.layer.cornerRadius = 8;
        create_group_label_view.layer.masksToBounds = true;
//        settings.layer.cornerRadius = 8;
//        settings.layer.masksToBounds = true;
        // Do any additional setup after loading the view.
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
