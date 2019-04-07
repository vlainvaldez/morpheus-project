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
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let lefViewTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(MainVC.morphLeftView)
        )
        
        self.rootview.leftView.addGestureRecognizer(lefViewTapGesture)
    }
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
