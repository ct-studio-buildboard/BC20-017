//
//  GroupDetailHomeViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/20/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

extension NSNotification.Name {
    static let globalVariableChanged = NSNotification.Name(Bundle.main.bundleIdentifier! + ".curPage")
}

public var curPage: Int = 0 {
    didSet {
        NotificationCenter.default.post(name: .globalVariableChanged, object: nil)
    }
}

class GroupDetailHomeViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var back_button: UIView!
    @IBOutlet weak var feed_label: UILabel!
    @IBOutlet weak var underline_bar_feed: UIView!
    
    @IBOutlet weak var charts_label: UILabel!
    @IBOutlet weak var underline_bar_charts: UIView!
    
    @IBOutlet weak var members_label: UILabel!
    @IBOutlet weak var underline_bar_members: UIView!
    
    private var observer: NSObjectProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        observer = NotificationCenter.default.addObserver(forName: .globalVariableChanged, object: nil, queue: .main) { [self] notification in
            
            //Do something on change
            if curPage == 0 { //Feed
                self.feed_label.textColor = UIColor.white
                self.charts_label.textColor = UIColor.lightGray
                self.members_label.textColor = UIColor.lightGray
                
                self.underline_bar_feed.backgroundColor = UIColor.white
                self.underline_bar_charts.backgroundColor = UIColor.black
                self.underline_bar_members.backgroundColor = UIColor.black
            }
            else if curPage == 1 { //Charts
                self.feed_label.textColor = UIColor.lightGray
                self.charts_label.textColor = UIColor.white
                self.members_label.textColor = UIColor.lightGray
                
                self.underline_bar_feed.backgroundColor = UIColor.black
                self.underline_bar_charts.backgroundColor = UIColor.white
                self.underline_bar_members.backgroundColor = UIColor.black
            }
            else if curPage == 2 { //Members
                self.feed_label.textColor = UIColor.lightGray
                self.charts_label.textColor = UIColor.lightGray
                self.members_label.textColor = UIColor.white
                
                self.underline_bar_feed.backgroundColor = UIColor.black
                self.underline_bar_charts.backgroundColor = UIColor.black
                self.underline_bar_members.backgroundColor = UIColor.white
            }
        }
        
        //back button
        let backGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backAction(tapGestureRecognizer:)))
        back_button.isUserInteractionEnabled = true
        back_button.addGestureRecognizer(backGestureRecognizer)
        
    }
    
    @objc func backAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.navigationController?.popToRootViewController(animated: true)
    }
    
        
    deinit {
        // remember to remove it when this object is deallocated

        NotificationCenter.default.removeObserver(observer)
    }
    

}
