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
        let name = userName.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        // Prepare URL
        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/initCreation/" + name)
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        let request = URLRequest(url: requestUrl)
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String / JSON
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                    
                    do {
                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [Dictionary<String,Any>]
                        {
                           print(jsonArray) // use the json here
                        } else {
                            print("bad json")
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }
        }
        
        task.resume()
    }
    


}
