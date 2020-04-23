//
//  LibraryViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var group_block1: UIImageView!
    @IBOutlet weak var groups_scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups_scroll.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
        (self.tabBarController as? ToolbarViewController)?.popInvite()
        //Get groups API call
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
        group_block1.isUserInteractionEnabled = true
        group_block1.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "groupDetailHome") as! GroupDetailHomeViewController
             vc.providesPresentationContextTransitionStyle = true
             vc.definesPresentationContext = true
             vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            self.navigationController?.pushViewController(vc, animated: true)
    }

}
