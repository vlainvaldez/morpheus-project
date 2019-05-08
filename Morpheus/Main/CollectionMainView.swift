//
//  CollectionMainView.swift
//  Morpheus
//
//  Created by Alvin Joseph Valdez on 08/05/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class CollectionMainView: UIView {
    
    public let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 10.0
        let view: UICollectionView = UICollectionView(
            frame: CGRect.zero,
            collectionViewLayout: layout
        )
        view.backgroundColor = UIColor.clear
        view.showsVerticalScrollIndicator = false
        view.allowsMultipleSelection = false
        return view
    }()

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        
        self.subview(forAutoLayout: self.collectionView)
        
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
