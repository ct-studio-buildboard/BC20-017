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
//        let name = userName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
//
//        // Prepare URL
//        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/getGroups/" + name)
//        guard let requestUrl = url else { fatalError() }
//
//        // Prepare URL Request Object
//        let request = URLRequest(url: requestUrl)
//
//        // Perform HTTP Request
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            // Check for Error
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//
//            // Convert HTTP Response Data to a String / JSON
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print("Response data string:\n \(dataString)")
//                do {
//                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
//                    {
//                       print(jsonArray) // use the json here
//                    } else {
//                        print("bad json")
//                    }
//                } catch let error as NSError {
//                    print(error)
//                }
//            }
//        }
//
//        task.resume()
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
