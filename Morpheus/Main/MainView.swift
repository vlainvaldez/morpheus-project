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
    
    public let rightView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private var leftViewWidth: Constraint!
    private var leftViewHeight: Constraint!
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.leftView, self.rightView
        ])
        
        self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.leftViewWidth = make.width.equalTo(150.0).constraint
            self.leftViewHeight = make.height.equalTo(300.0).constraint
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
        }
        
        self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.width.equalTo(150.0)
            make.height.equalTo(300.0)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    public func morphLeftView() {
        UIView.animate(withDuration: 3.0) {
            self.leftView.snp.removeConstraints()
            
            self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                make.height.equalTo(500.0)
                make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
                make.leading.equalToSuperview().offset(20.0)
                make.trailing.equalToSuperview().inset(20.0)
            }
            
            self.rightView.snp.removeConstraints()
            
            self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                make.height.equalTo(300.0)
                make.top.equalTo(self.leftView.snp.bottom).offset(20.0)
                make.trailing.equalToSuperview().inset(20.0)
                make.leading.equalToSuperview().offset(20.0)
            }

            self.layoutIfNeeded()
        }
        
        
    }
}
