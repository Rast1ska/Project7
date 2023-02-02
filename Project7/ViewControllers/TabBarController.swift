//
//  TabBarController.swift
//  Project7
//
//  Created by Ильфат Салахов on 02.02.2023.
//

import UIKit


class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainViewController = MainViewController()
        let detailViewController = DetailViewController()
        
        viewControllers = [mainViewController, detailViewController]
        
    }
}
