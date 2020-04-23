//
//  FeedViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/20/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var comment1: UIImageView!
    @IBOutlet weak var comment2: UIImageView!
    @IBOutlet weak var song_image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(oneTapped(tapGestureRecognizer:)))
        comment1.isUserInteractionEnabled = true
        comment1.addGestureRecognizer(tapGestureRecognizerOne)

        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(twoTapped(tapGestureRecognizer:)))
        comment2.isUserInteractionEnabled = true
        comment2.addGestureRecognizer(tapGestureRecognizerTwo)

        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(threeTapped(tapGestureRecognizer:)))
        song_image.isUserInteractionEnabled = true
        song_image.addGestureRecognizer(tapGestureRecognizerThree)
    }
    
    //comment 1 tapped
    @objc func oneTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
       let vc = storyboard?.instantiateViewController(withIdentifier: "commentsPage") as! CommentsViewController
        vc.modalPresentationStyle = .fullScreen
       self.present(vc, animated: true, completion: nil)
    }
       
    //comment 2 tapped
    @objc func twoTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "commentsPage") as! CommentsViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    //song image tapped
    @objc func threeTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        audioPlayer.play()
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "playView")) as! playViewController as playViewController
        vc.modalPresentationStyle = .popover

        if let presentationController = vc.popoverPresentationController {
          presentationController.delegate = self
          presentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
          presentationController.sourceView = self.view
          presentationController.sourceRect = CGRect(x:self.view.bounds.midX, y: self.view.bounds.midY,width: 315,height: 230)

          self.present(vc, animated: true, completion: nil)
        }
    }
}
