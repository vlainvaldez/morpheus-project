//
//  MainView.swift
//  Morpheus
//
//  Created by alvin joseph valdez on 07/04/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class MainView: UIView {
    
    // MARK: Subviews
    public let leftView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.leftView
        ])
        
        self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.width.equalTo(150.0)
            make.height.equalTo(300.0)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
