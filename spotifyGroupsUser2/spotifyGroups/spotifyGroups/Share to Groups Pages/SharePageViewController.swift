//
//  SharePageViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/22/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

class SharePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    private func setupPageControl() {
        let appearance = UIPageControl.appearance()
        let back_color = UIColor(rgb:0x121212)
        let select_color = UIColor(rgb: 0x282828)
        appearance.pageIndicatorTintColor = select_color
        appearance.currentPageIndicatorTintColor = UIColor.white
        appearance.backgroundColor = back_color
    }

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.groupShareViewController(number: "One"),
                self.groupShareViewController(number: "Two")]
    }()

    private func groupShareViewController(number: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "groupShare\(number)")
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
