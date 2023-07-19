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
        setupGradientLayer()
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
    
    private func setupGradientLayer() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.5).cgColor]
        gradientLayer.locations = [0, 1]
        
        let containerView = UIView()
        addSubview(containerView)
        containerView.anchor(top: nil,
                             bottom: bottomAnchor,
                             leading: leadingAnchor,
                             trailing: trailingAnchor)
        
        containerView.layer.addSublayer(gradientLayer)
        
        gradientLayer.frame = bounds
        
        gradientLayer.frame.origin.y -= bounds.height
    }
    
}
