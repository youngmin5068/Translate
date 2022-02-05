//
//  ViewController.swift
//  Translate
//
//  Created by 김영민 on 2022/02/04.
//

import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let translateViewController = TranslateViewController()
        let bookmarkViewController = BookmarkListViewController()
        
        translateViewController.tabBarItem = UITabBarItem(
            title:"Translate",
            image: UIImage(systemName: "mic"),
            selectedImage: UIImage(systemName: "mic.fill"))
        
        bookmarkViewController.tabBarItem = UITabBarItem(
            title:"Bookmark",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill"))
       
        viewControllers = [translateViewController,bookmarkViewController]
    }


}

