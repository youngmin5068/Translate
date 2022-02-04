//
//  TranslateView.swift
//  Translate
//
//  Created by 김영민 on 2022/02/04.
//

import UIKit
import SnapKit
import SwiftUI

final class TranslateViewController: UIViewController {
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Korean", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        return button
    }()
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle("English", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15.0, weight: .semibold)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .systemBackground
        button.layer.cornerRadius = 9.0
        return button
    }()
    
    private lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.spacing = 8.0
        
        [sourceLanguageButton,targetLanguageButton]
            .forEach{ stackView.addArrangedSubview($0)}
        
        return stackView
    }()
    
    private lazy var resultBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 23.0, weight: .bold)
        label.textColor = .systemPink
        label.text = "Hello"
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .systemPink
        
        return button
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.tintColor = .systemPink
        
        return button
    }()
    
    private lazy var sourceLabelBaseView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didTapSourceLabelBaseView))
        view.addGestureRecognizer(tapgesture)
        
        return view
    }()
    
    @objc func didTapSourceLabelBaseView(){
        present(SourceTextViewController(delegate: self), animated: true)
    }
    
    private lazy var sourceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "텍스트 입력"
        label.textColor = .tertiaryLabel
        //TODO: sourceLabel 에 입력 값이 추가되면, placeholder 스타일 해제
        
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 23.0, weight: .semibold)
        
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    
        setupViews()
    }
}


extension TranslateViewController: SourceTextViewControllerDelegate {
    func didEnterText(_ sourceText: String) {
        if sourceText.isEmpty {return}
        
        sourceLabel.textColor = .label
        sourceLabel.text = sourceText
    }
}



private extension TranslateViewController {
    
    func setupViews() {
        [
            buttonStackView,
            resultBaseView,
            resultLabel,
            bookmarkButton,
            copyButton,
            sourceLabelBaseView,
            sourceLabel
        ]
            .forEach{view.addSubview($0)}
        
        
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(50.0)
        }
        
        resultBaseView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(buttonStackView.snp.bottom).offset(16.0)
            $0.bottom.equalTo(bookmarkButton.snp.bottom).offset(16.0)
        }
        
        resultLabel.snp.makeConstraints {
            $0.leading.equalTo(resultBaseView.snp.leading).inset(24.0)
            $0.trailing.equalTo(resultBaseView.snp.trailing).inset(24.0)
            $0.top.equalTo(resultBaseView.snp.top).inset(24.0)
        }
        bookmarkButton.snp.makeConstraints {
            $0.leading.equalTo(resultLabel.snp.leading)
            $0.top.equalTo(resultLabel.snp.bottom).offset(24.0)
            $0.width.height.equalTo(40.0)
        }
        copyButton.snp.makeConstraints{
            $0.leading.equalTo(bookmarkButton.snp.trailing).offset(8.0)
            $0.top.equalTo(bookmarkButton.snp.top)
            $0.width.height.equalTo(40.0)
        }
        
        sourceLabelBaseView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(resultBaseView.snp.bottom).offset(16.0)
            $0.bottom.equalToSuperview().inset(tabBarController?.tabBar.frame.height ?? 0.0)
        }
        
        sourceLabel.snp.makeConstraints{
            $0.leading.equalTo(sourceLabelBaseView.snp.leading).inset(24.0)
            $0.trailing.equalTo(sourceLabelBaseView.snp.trailing).inset(24.0)
            $0.top.equalTo(sourceLabelBaseView.snp.top).inset(24.0)
        }
    }

}
