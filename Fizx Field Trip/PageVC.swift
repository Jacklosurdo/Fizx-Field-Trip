//
//  PageVC.swift
//  Fizx Field Trip
//
//  Created by Hussain Haq  on 4/28/17.
//  Copyright © 2017 Jack. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var  VCArr: [UIViewController] = {
    return [self.VCInstant(name: "firstVC"),
            self.VCInstant(name: "secondVC"), ]
    }()
    
    private func VCInstant(name: String)-> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstVC = VCArr.first{
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = VCArr.index(of: viewController) else{
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else{
            return VCArr.last
        }
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        
    }

    optional public func presentationCount(for pageViewController: UIPageViewController) -> Int{
        
    }
    
    optional public func presentationIndex(for pageViewController: UIPageViewController) -> Int{
        
    }
}
