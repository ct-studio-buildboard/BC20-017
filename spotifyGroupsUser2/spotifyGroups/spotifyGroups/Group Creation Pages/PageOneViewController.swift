//
//  PageOneViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var groupName: UITextView!
    @IBOutlet weak var groupDesc: UITextView!
    
    @IBOutlet weak var main_view: UIView!
    
    var gradientLayer = CAGradientLayer()
    var button = RoundButton(frame: CGRect(x: 97, y: 630, width: 180, height: 46))
    
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.3)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.7)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = main_view.bounds

        main_view.layer.insertSublayer(gradientLayer, at: 0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        button.cornerRadius = 23
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font =  UIFont(name: "CircularStd-Bold", size: 12)
        main_view.addSubview(button)
        setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
        
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        groupName.delegate = self
        groupDesc.delegate = self
        groupName.textContainer.maximumNumberOfLines = 1
        groupName.textContainer.lineBreakMode = .byTruncatingTail
        groupDesc.textContainer.maximumNumberOfLines = 1
        groupDesc.textContainer.lineBreakMode = .byTruncatingTail
        
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Group Name" {
            groupName.text = String()
        }
        else if textView.text == "Group Description" {
            groupDesc.text = String()
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }


}
