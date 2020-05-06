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
    let green = UIColor(rgb: 0x1DB954)
    var vc: UIPageViewController!
    
    private var observer: NSObjectProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //let green = UIColor(rgb: 0x1DB954)
//        observer = NotificationCenter.default.addObserver(forName: .globalVariableChanged, object: nil, queue: .main) { [self] notification in
//            
//            //Do something on change
//            if curPage == 0 { //Feed
//                self.feed_label.textColor = UIColor.white
//                self.charts_label.textColor = UIColor.lightGray
//                self.members_label.textColor = UIColor.lightGray
//                
//                self.underline_bar_feed.backgroundColor = self.green
//                self.underline_bar_charts.backgroundColor = UIColor.black
//                self.underline_bar_members.backgroundColor = UIColor.black
//            }
//            else if curPage == 1 { //Charts
//                self.feed_label.textColor = UIColor.lightGray
//                self.charts_label.textColor = UIColor.white
//                self.members_label.textColor = UIColor.lightGray
//                
//                self.underline_bar_feed.backgroundColor = UIColor.black
//                self.underline_bar_charts.backgroundColor = self.green
//                self.underline_bar_members.backgroundColor = UIColor.black
//            }
//            else if curPage == 2 { //Members
//                self.feed_label.textColor = UIColor.lightGray
//                self.charts_label.textColor = UIColor.lightGray
//                self.members_label.textColor = UIColor.white
//                
//                self.underline_bar_feed.backgroundColor = UIColor.black
//                self.underline_bar_charts.backgroundColor = UIColor.black
//                self.underline_bar_members.backgroundColor = self.green
//            }
//        }
        
        //Trying to code click to change page
        vc = storyboard!.instantiateViewController(withIdentifier: "groupDetail") as! UIPageViewController
        vc.willMove(toParent: self)
        self.addChild(vc)
        container.addSubview(vc.view)
        vc.didMove(toParent: self)
        let w = container.frame.size.width;
        let h = container.frame.size.height;
        vc.view.frame = CGRect(x: 0, y: 0, width: w, height: h)
        
        //back button
        let backGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backAction(tapGestureRecognizer:)))
        back_button.isUserInteractionEnabled = true
        back_button.addGestureRecognizer(backGestureRecognizer)
        
        //feed button
        let feedGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(feedAction(tapGestureRecognizer:)))
        feed_label.isUserInteractionEnabled = true
        feed_label.addGestureRecognizer(feedGestureRecognizer)
        
        //charts button
        let chartsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chartsAction(tapGestureRecognizer:)))
        charts_label.isUserInteractionEnabled = true
        charts_label.addGestureRecognizer(chartsGestureRecognizer)
        
        //members button
        let membersGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(membersAction(tapGestureRecognizer:)))
        members_label.isUserInteractionEnabled = true
        members_label.addGestureRecognizer(membersGestureRecognizer)

        
    }
    
    @objc func backAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.navigationController?.popToRootViewController(animated: true)
    }
    @objc func feedAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.feed_label.textColor = UIColor.white
        self.charts_label.textColor = UIColor.lightGray
        self.members_label.textColor = UIColor.lightGray

        self.underline_bar_feed.backgroundColor = green
        self.underline_bar_charts.backgroundColor = UIColor.black
        self.underline_bar_members.backgroundColor = UIColor.black
        vc.goToPreviousPage()
        vc.goToPreviousPage()
        curPage = 0
    }
    @objc func chartsAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.feed_label.textColor = UIColor.lightGray
        self.charts_label.textColor = UIColor.white
        self.members_label.textColor = UIColor.lightGray

        self.underline_bar_feed.backgroundColor = UIColor.black
        self.underline_bar_charts.backgroundColor = green
        self.underline_bar_members.backgroundColor = UIColor.black
        
        if(curPage == 0){
            vc.goToNextPage()
        }
        else if (curPage == 2) {
            vc.goToPreviousPage()
        }
        curPage = 1
    }
    @objc func membersAction(tapGestureRecognizer: UITapGestureRecognizer){
        self.feed_label.textColor = UIColor.lightGray
        self.charts_label.textColor = UIColor.lightGray
        self.members_label.textColor = UIColor.white

        self.underline_bar_feed.backgroundColor = UIColor.black
        self.underline_bar_charts.backgroundColor = UIColor.black
        self.underline_bar_members.backgroundColor = green
        vc.goToNextPage()
        vc.goToNextPage()
        curPage = 2
    }
    
        
    deinit {
        // remember to remove it when this object is deallocated

        NotificationCenter.default.removeObserver(observer)
    }
    

}
