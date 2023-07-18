//
//  StretchyHeaderViewController.swift
//  StretchyHeaderCollectionView
//
//  Created by Ahmed Amin on 18/07/2023.
//

import UIKit

class StretchyHeaderViewController: UIViewController {
    
    // MARK: - ATTRIBUTES
    
    private let cellId = "CellId"
    private let headerId = "HeaderId"
    private let padding: CGFloat = 16.0
    
    // MARK: - IBOUTLETS
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupCollectionHeaderView()
        setupCustomLayout()
        
    }
    
    
    // MARK: - SETUP COLLECTION
    
    private func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(UICollectionViewCell.self,
                                forCellWithReuseIdentifier: cellId)
    }
    
    private func setupCollectionHeaderView() {
        
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerId)
    }
    
    private func setupCustomLayout() {
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        layout.sectionInset = UIEdgeInsets(top: padding,
                                           left: padding,
                                           bottom: padding,
                                           right: padding)
    }
}

// MARK: - DATA SOURCE

extension StretchyHeaderViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .blue
        
        return cell
    }
    
    
    // MARK:  - HEADER VIEW
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                     withReuseIdentifier: headerId,
                                                                     for: indexPath)
        
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width,
                     height: 340)
    }
}


// MARK: - FLOW LAYOUT

extension StretchyHeaderViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame .width - (2 * padding ),
                     height: 50)
    }
    
}


// MARK: - DELEGATE

extension StretchyHeaderViewController: UICollectionViewDelegate {
    
}

