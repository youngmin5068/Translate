//
//  BookmarkView.swift
//  Translate
//
//  Created by 김영민 on 2022/02/04.
//


import UIKit
import SnapKit


final class BookmarkListViewController : UIViewController {
    
    private var bookmark: [Bookmark] = []
    
    private lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32.0, height: 100.0)
        layout.sectionInset = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        layout.minimumLineSpacing = 16.0
        
        
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collectionView.backgroundColor = .secondarySystemBackground
       
        collectionView.register(BookmarkCollectionViewCell.self, forCellWithReuseIdentifier: BookmarkCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        navigationItem.title = "즐겨찾기"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        bookmark = UserDefaults.standard.bookmarks
        collectionView.reloadData()
    }
}

extension BookmarkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bookmark.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BookmarkCollectionViewCell.identifier,
            for: indexPath)as? BookmarkCollectionViewCell
        
        let bookmark = bookmark[indexPath.item]
        cell?.setup(from: bookmark)
        
        return cell ?? UICollectionViewCell()
    }
    
    
}

private extension BookmarkListViewController {
    func setupLayout() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
}
