//
//  PageTwoViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {
    
    @IBOutlet weak var view_one: UIView!
    @IBOutlet weak var view_two: UIView!
    @IBOutlet weak var view_three: UIView!
    @IBOutlet weak var view_four: UIView!
    @IBOutlet weak var view_five: UIView!
    @IBOutlet weak var view_six: UIView!
    
    @IBOutlet weak var main_view: UIView!
    
    let selectedImage = UIImage(named: "selected_circle")!
    let unselectedImage = UIImage(named: "unselected_circle")!
    @IBOutlet weak var check_one: UIImageView!
    @IBOutlet weak var check_two: UIImageView!
    @IBOutlet weak var check_three: UIImageView!
    @IBOutlet weak var check_four: UIImageView!
    @IBOutlet weak var check_five: UIImageView!
    @IBOutlet weak var check_six: UIImageView!
    var gradientLayer = CAGradientLayer()
    var button = RoundButton(frame: CGRect(x: 97, y: 630, width: 180, height: 46))
    
    var total_selected = 0
    var loaded = false
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.3)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.7)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = main_view.bounds

        main_view.layer.insertSublayer(gradientLayer, at: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main_view.layer.cornerRadius = 8;
        main_view.layer.masksToBounds = true;
        // Do any additional setup after loading the view.
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
        view_one.isUserInteractionEnabled = true
        view_one.addGestureRecognizer(tapGestureRecognizerOne)
        
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(twoTapped(tapGestureRecognizer:)))
        view_two.isUserInteractionEnabled = true
        view_two.addGestureRecognizer(tapGestureRecognizerTwo)
        
        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(threeTapped(tapGestureRecognizer:)))
        view_three.isUserInteractionEnabled = true
        view_three.addGestureRecognizer(tapGestureRecognizerThree)
        
        let tapGestureRecognizerFour = UITapGestureRecognizer(target: self, action: #selector(fourTapped(tapGestureRecognizer:)))
        view_four.isUserInteractionEnabled = true
        view_four.addGestureRecognizer(tapGestureRecognizerFour)
        
        let tapGestureRecognizerFive = UITapGestureRecognizer(target: self, action: #selector(fiveTapped(tapGestureRecognizer:)))
        view_five.isUserInteractionEnabled = true
        view_five.addGestureRecognizer(tapGestureRecognizerFive)
        
        let tapGestureRecognizerSix = UITapGestureRecognizer(target: self, action: #selector(sixTapped(tapGestureRecognizer:)))
        view_six.isUserInteractionEnabled = true
        view_six.addGestureRecognizer(tapGestureRecognizerSix)
        
        //Creating the Finish Button
//        button = RoundButton(frame: CGRect(x: 97, y: 630, width: 180, height: 46))
        button.cornerRadius = 23
        button.backgroundColor = UIColor.white
        button.setTitleColor(.black, for: .normal)
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.font =  UIFont(name: "CircularStd-Bold", size: 12)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        // Set up a struct for sending json for POST to the url
        let parameters: [String: Any] = [
            "userName": userName!,
            "groupName": "Cornell Tech",
            "groupDesc": "Group for Cornell Tech Students",
            "members": ["Max Klein", "Bobo Liu", "Shuhan Zhang"]
        ]
        
        // Prepare URL
        let url = URL(string: "http://spotify-env.eba-iqymqugf.us-west-2.elasticbeanstalk.com/api/createGroup/")
        guard let requestUrl = url else { fatalError() }
        
        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        let json_data = try? JSONSerialization.data(withJSONObject: parameters)
        
        request.httpBody = json_data
        
        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                self.loaded = true
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        
        task.resume()
        
        repeat {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        } while !self.loaded
        self.loaded = false
        
        handler()
        
        self.dismiss(animated: true, completion: {
            handler()
            self.presentingViewController?.dismiss(animated: true, completion: nil)})
    }
    
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_one.image == selectedImage {
            check_one.image = unselectedImage
            total_selected -= 1
            if total_selected == 0 {
                gradientLayer.removeFromSuperlayer()
                button.removeFromSuperview()
            }
        } else {
            check_one.image = selectedImage
            total_selected += 1
            setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
            main_view.addSubview(button)
        }
    }
    
    @objc func twoTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_two.image == selectedImage {
               check_two.image = unselectedImage
               total_selected -= 1
                if total_selected == 0 {
                    gradientLayer.removeFromSuperlayer()
                    button.removeFromSuperview()
                }
           } else {
                check_two.image = selectedImage
                total_selected += 1
                setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                main_view.addSubview(button)
           }
       }
    @objc func threeTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_three.image == selectedImage {
               check_three.image = unselectedImage
               total_selected -= 1
                if total_selected == 0 {
                    gradientLayer.removeFromSuperlayer()
                    button.removeFromSuperview()
                }
           } else {
               check_three.image = selectedImage
               total_selected += 1
                setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                main_view.addSubview(button)
           }
       }
    
    @objc func fourTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           if check_four.image == selectedImage {
               check_four.image = unselectedImage
               total_selected -= 1
                if total_selected == 0 {
                    gradientLayer.removeFromSuperlayer()
                    button.removeFromSuperview()
                }
           } else {
               check_four.image = selectedImage
               total_selected += 1
                setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
                main_view.addSubview(button)
           }
       }

    @objc func fiveTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_five.image == selectedImage {
            check_five.image = unselectedImage
            total_selected -= 1
             if total_selected == 0 {
                 gradientLayer.removeFromSuperlayer()
                 button.removeFromSuperview()
             }
        } else {
            check_five.image = selectedImage
            total_selected += 1
             setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
             main_view.addSubview(button)
        }
    }
    
    @objc func sixTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if check_six.image == selectedImage {
            check_six.image = unselectedImage
            total_selected -= 1
             if total_selected == 0 {
                 gradientLayer.removeFromSuperlayer()
                 button.removeFromSuperview()
             }
        } else {
            check_six.image = selectedImage
            total_selected += 1
             setGradientBackground(colorTop: .clear, colorBottom: UIColor(rgb:0x121212))
             main_view.addSubview(button)
        }
    }
    

}
