//
//  GroupDetailsPageViewController.swift
//  spotifyGroups
//
//  Created by Bobo Liu on 4/20/20.
//  Copyright © 2020 Spotify. All rights reserved.
//

import UIKit

extension UIPageViewController {

    func goToNextPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let nextViewController = dataSource?.pageViewController(self, viewControllerAfter: currentViewController) else { return }
        setViewControllers([nextViewController], direction: .forward, animated: animated, completion: nil)
    }

    func goToPreviousPage(animated: Bool = true) {
        guard let currentViewController = self.viewControllers?.first else { return }
        guard let previousViewController = dataSource?.pageViewController(self, viewControllerBefore: currentViewController) else { return }
        setViewControllers([previousViewController], direction: .reverse, animated: animated, completion: nil)
    }

}

class GroupDetailsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "groupFeed"),
                UIStoryboard(name: "Main", bundle: nil) .
                instantiateViewController(withIdentifier: "groupCharts"),
        UIStoryboard(name: "Main", bundle: nil) .
        instantiateViewController(withIdentifier: "groupMembers")]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dataSource = self
        delegate = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                animated: true,
                completion: nil)
        }
    }
    
    //swiping left
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = orderedViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                //index = 1
                if curPage != index {curPage = index}
                return orderedViewControllers[index - 1]
            } else {
                //index = 0
                if curPage != index {curPage = index}
                return nil
            }
        }

        return nil
    }
    
    //swiping right
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = orderedViewControllers.firstIndex(of: viewController) {
            if index < orderedViewControllers.count - 1 {
                //index = 1
                if curPage != index {curPage = index}
                return orderedViewControllers[index + 1]
            } else {
                //index = 2
                if curPage != index {curPage = index}
                return nil
            }
        }

        return nil
    }
    



}
