//
//  ProductView.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 18/05/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class ProductView: UIView {
    
    // MARK: Initializer
    public init(state: ProductVC.State) {
        self.state = state
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Stored Properties
    public var state: ProductVC.State {
        didSet {
            switch self.state {
            case .beneath:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.yellow.withAlphaComponent(0.7)
                }
            case .expanded:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                }
            case .normal:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
                }
            }
        }
    }
    
}
