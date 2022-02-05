//
//  BookmarkView.swift
//  Translate
//
//  Created by 김영민 on 2022/02/04.
//


import UIKit
import SnapKit


final class BookmarkListViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "즐겨찾기"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
