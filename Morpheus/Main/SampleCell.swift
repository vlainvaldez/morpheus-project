//
//  SampleCell.swift
//  Morpheus
//
//  Created by Alvin Joseph Valdez on 08/05/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class SampleCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SampleCell {
    public static var identifier: String = "SampleCell"
    
    public func configure(with viewModel: CellViewModel) {
        
    }
}
