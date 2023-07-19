//
//  HeaderView.swift
//  StretchyHeaderCollectionView
//
//  Created by Ahmed Amin on 18/07/2023.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - ATTRIBUTES
    
    var animator: UIViewPropertyAnimator!
    
    private lazy var visualEffectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    
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
        setupVisualEffect()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHeaderView() {
     
        addSubview(imageView)
        imageView.fillSuperview()
        
    }
    
    private func setupVisualEffect() {
        
        addSubview(visualEffectView)
        visualEffectView.fillSuperview()
        
        animator = UIViewPropertyAnimator(duration: 1.0,
                                          curve: .linear,
                                          animations: { [weak self] in
            guard let self = self else { return }
            
            self.visualEffectView.effect = nil
        })
        
        animator.isReversed = true
        animator.fractionComplete = 0
    }
    
}
