//
//  HeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by Ahmed Amin on 18/07/2023.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - ATTRIBUTES
    
    private lazy var imageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stretchy_header")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
        
    
    
    // MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
     
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
}
