//
//  ViewController.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 07/04/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: Initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = MainView(
            riskView: self.riskVC.rootView,
            performanceView: self.performanceVC.rootView
        )
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let lefViewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(MainVC.morphLeftView)
        )
        
        self.title = "Project Morpheus"
        
        self.rootview.leftView.addGestureRecognizer(lefViewTapGesture)
    }
    
    // MARK: - Stored Properties
    public var riskVC: RiskVC = RiskVC(state: MorphingViewState.normal)
    public var performanceVC: PerformanceVC = PerformanceVC(state: MorphingViewState.normal)
}

// MARK: - Views
extension MainVC {
    public unowned var rootview: MainView { return self.view as! MainView }
}

extension MainVC {
    
    @objc func morphLeftView() {
        self.rootview.morphLeftView()
    }
}
