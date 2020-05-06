//
//  playViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/14/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class playViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    @IBOutlet weak var settings_button: UIView!
    @IBOutlet weak var time_left_text: UITextView!
    @IBOutlet weak var time_played_text: UITextView!
    
    @IBOutlet weak var progress_slider: UISlider!
    @IBOutlet weak var play_pause_button: UIImageView!
    
    let playImg = UIImage(systemName: "play.circle.fill")!
    let pauseImg = UIImage(systemName: "pause.circle.fill")!
    
    var delegate:playViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNeedsStatusBarAppearanceUpdate()
        self.progress_slider.setThumbImage(UIImage(named: "play_circle_icon")!, for: .normal)
        var updater = CADisplayLink(target: self, selector: #selector(self.trackAudio))
        updater.preferredFramesPerSecond = 1
        updater.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
        
        //Pause, play gestures
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(controlTapped(tapGestureRecognizer:)))
        play_pause_button.isUserInteractionEnabled = true
        play_pause_button.addGestureRecognizer(tapGestureRecognizer)
        
        //settings gesture
        let settingsGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(settingsTapped(tapGestureRecognizer:)))
        settings_button.isUserInteractionEnabled = true
        settings_button.addGestureRecognizer(settingsGestureRecognizer)
        
        if audioPlayer.isPlaying {
            play_pause_button.image = pauseImg
        } else {
            play_pause_button.image = playImg
        }

    }
    
    private func convertToTimeString(time: Int) -> String {
        let minutes = time/60
        let seconds = time % 60
        if seconds < 10 {
            return String(minutes) + ":0" + String(seconds)
        } else {
            return String(minutes) + ":" + String(seconds)
        }
    }
    
    @objc func trackAudio() {
        var progress = audioPlayer.currentTime / audioPlayer.duration
        progress_slider.value = Float(progress)
        var time_played = Int(audioPlayer.currentTime.rounded())
        time_played_text.text = convertToTimeString(time: time_played)
        var time_left = Int(audioPlayer.duration.rounded()) - time_played
        time_left_text.text = "-" + convertToTimeString(time: time_left)
    }
    
    @objc func controlTapped(tapGestureRecognizer: UITapGestureRecognizer)
       {
           let tappedImage = tapGestureRecognizer.view as! UIImageView
            
           if  audioPlayer.isPlaying{
                audioPlayer.pause()
                play_pause_button.image = playImg
                delegate?.swapIcons()
           } else {
                audioPlayer.play()
                play_pause_button.image = pauseImg
                delegate?.swapIcons()
            }
       }
    
    @objc func settingsTapped(tapGestureRecognizer: UITapGestureRecognizer)
          {
              //We want to present "songDetails"
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "songDetails")) as! songDetailsViewController as songDetailsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
//            vc.modalPresentationStyle = .popover
//            if let presentationController = vc.popoverPresentationController {
//                presentationController.delegate = self
//                presentationController.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
//                presentationController.sourceView = self.view
//                presentationController.sourceRect = CGRect(x:self.view.bounds.midX, y: self.view.bounds.midY,width: 315,height: 230)
//
//                self.present(vc, animated: true, completion: nil)
//            }
          }
    

}
