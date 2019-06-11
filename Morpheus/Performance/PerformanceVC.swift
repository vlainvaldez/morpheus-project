//
//  PerformanceVC.swift
//  Morpheus
//
//  Created by Alvin Joseph Valdez on 11/06/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class PerformanceVC: UIViewController {
    
    // MARK: - Initializer
    public init(state: MorphingViewState) {
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = PerformanceView(state: self.state)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Stored Properties
    public var state: MorphingViewState
}

extension PerformanceVC {
    public var rootView: PerformanceView { return self.view as! PerformanceView }
}
