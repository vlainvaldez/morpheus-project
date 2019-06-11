//
//  ProductVC.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 18/05/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class RiskVC: UIViewController {
    
    // MARK: Initializer
    public init(state: MorphingViewState) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = RiskView(state: self.state)
    }
    
    public override  func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Stored Properties
    public var state: MorphingViewState
}

extension RiskVC {
    public var rootView: RiskView { return self.view as! RiskView }
}
