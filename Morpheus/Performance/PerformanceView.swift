//
//  PerformanceView.swift
//  Morpheus
//
//  Created by Alvin Joseph Valdez on 11/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class PerformanceView: UIView {
    
    // MARK: - Initializer
    public init(state: MorphingViewState) {
        self.state = state
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.yellow.withAlphaComponent(0.7)
        
        switch self.state {
        case .normal:
            break
        case .expanded:
            break
        case .beneath:
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Stored Properties
    public var state: MorphingViewState {
        didSet {
            switch self.state {
            case .beneath:
                break
            case .expanded:
                break
            case .normal:
                break
            }
        }
    }
}

// MARK: - StateLayouts Methods
extension PerformanceView: StateLayouts {
    
    public func normalState() {
        
    }
    
    public func expandedState() {
        
    }
    
    public func beneathState() {
        
    }
}
