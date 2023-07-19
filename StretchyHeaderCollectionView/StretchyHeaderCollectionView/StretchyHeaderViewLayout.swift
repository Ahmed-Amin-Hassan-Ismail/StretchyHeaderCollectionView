//
//  StretchyHeaderViewLayout.swift
//  StretchyHeaderCollectionView
//
//  Created by Ahmed Amin on 18/07/2023.
//

import UIKit

class StretchyHeaderViewLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ attribute in
            
            
            if attribute.representedElementKind == UICollectionView.elementKindSectionHeader &&
                attribute.indexPath.section == 0 {
                
                guard let collectionView = collectionView else { return }
                
                let contentYOffset = collectionView.contentOffset.y
                
                guard contentYOffset <  0 else { return }
                
                let width = collectionView.frame.width
                let height = attribute.frame.height - contentYOffset
                
                
                
                attribute.frame = CGRect(x: 0, y: contentYOffset, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        return true
    }
    
}
