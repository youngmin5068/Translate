//
//  BookmarkCollectionViewCell.swift
//  Translate
//
//  Created by 김영민 on 2022/02/05.
//

import SnapKit
import UIKit

final class BookmarkCollectionViewCell : UICollectionViewCell {
    static let identifier = "BookmarkCollectionViewCell"
    
    private var sourceBookmarkTextStackView: bookmarkTextStackView!
    private var targetBookmarkTextStackView: bookmarkTextStackView!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0
        
        //공부
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        return stackView
    }()
    
    func setup(from bookmark: Bookmark) {
        backgroundColor = .systemBackground
        layer.cornerRadius = 12.0
        
        sourceBookmarkTextStackView = bookmarkTextStackView(
            language: bookmark.sourceLanguage,
            text: bookmark.sourceText,
            type: .source)
        
        targetBookmarkTextStackView = bookmarkTextStackView(
            language: bookmark.translatedLanguage,
            text: bookmark.translatedText,
            type: .target)
        
        stackView.subviews.forEach{ $0.removeFromSuperview()}
        
        [sourceBookmarkTextStackView,targetBookmarkTextStackView]
            .forEach{ stackView.addArrangedSubview($0)}
        
        addSubview(stackView)
        stackView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width - 32.0)
        }
        
        layoutIfNeeded() //layout 업데이트
     
    }
}
