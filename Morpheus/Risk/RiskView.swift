//
//  ProductView.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 18/05/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class RiskView: UIView {
    
    private let headerLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Just a header Label"
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Just a description Label"
        return view
    }()
    
    // MARK: Initializer
    public init(state: MorphingViewState) {
        self.state = state
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
        
        self.subviews(forAutoLayout: [
            self.headerLabel, self.descriptionLabel
        ])
        
        switch self.state {
        case .normal:
            self.normalState()
        case .expanded:
            self.expandedState()
        case .beneath:
            break
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Stored Properties
    public var state: MorphingViewState {
        didSet {
            switch self.state {
            case .beneath:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.yellow.withAlphaComponent(0.7)
                }
            case .expanded:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.red.withAlphaComponent(0.7)
                    self.expandedState()
                }
            case .normal:
                UIView.animate(withDuration: 0.3) {
                    self.backgroundColor = UIColor.blue.withAlphaComponent(0.7)
                    self.normalState()
                }
            }
        }
    }
}


extension RiskView: StateLayouts {
    public func normalState() {
        self.headerLabel.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(5.0)
        }
        self.descriptionLabel.snp.removeConstraints()
        self.descriptionLabel.isHidden = true
        
        self.layoutIfNeeded()
    }
    
    public func expandedState() {
        self.descriptionLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(self.headerLabel.snp.bottom).offset(5.0)
        }
        
        self.descriptionLabel.isHidden = false
        
        self.layoutIfNeeded()
    }
    
    public func beneathState() {
        
    }
    
}
