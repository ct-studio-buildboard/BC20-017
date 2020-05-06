//
//  musicToGroupsViewController.swift
//  spotifyGroups2
//
//  Created by Bobo Liu on 4/23/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class musicToGroupsViewController: UIViewController {

    @IBOutlet weak var groupButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
         groupButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    

    @objc func buttonAction(sender: UIButton!) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "libraryPage") as! LibraryViewController
              vc.providesPresentationContextTransitionStyle = true
              vc.definesPresentationContext = true
              vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
             self.navigationController?.pushViewController(vc, animated: true)
       }

}
