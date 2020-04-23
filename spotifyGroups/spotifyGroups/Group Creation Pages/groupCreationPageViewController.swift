//
//  groupCreationPageViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/13/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }

   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}
import UIKit

class groupCreationPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        let back_color = UIColor(rgb:0x121212)
        let select_color = UIColor(rgb: 0x282828)
        appearance.pageIndicatorTintColor = select_color
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = back_color
    }

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.groupCreationViewController(number: "One"),
                self.groupCreationViewController(number: "Two")]
    }()

    private func groupCreationViewController(number: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "groupCreation\(number)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                animated: true,
                completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = orderedViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return orderedViewControllers[index - 1]
            } else {
                return nil
            }
        }

        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = orderedViewControllers.firstIndex(of: viewController) {
            if index < orderedViewControllers.count - 1 {
                return orderedViewControllers[index + 1]
            } else {
                return nil
            }
        }

        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        setupPageControl()
        return orderedViewControllers.count
        }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
        }
    

    

}

