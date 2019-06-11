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
    private let scrollView: UIScrollView = {
        let view: UIScrollView = UIScrollView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    private let viewContainer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    public let leftView: MorpheusView = {
        let view: MorpheusView = MorpheusView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let rightView: MorpheusView = {
        let view: MorpheusView = MorpheusView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view: UILabel = UILabel()
        view.text = "Just a description Label"
        return view
    }()
    
    // MARK: - Stored Properties
    private var leftViewWidth: Constraint!
    private var leftViewHeight: Constraint!
    
    private var rightViewWidth: Constraint!
    private var rightViewHeight: Constraint!
    
    private var morpheusViewWidth: CGFloat!
    private var expandedMorpheusHeight: CGFloat!
    
    private var riskView: RiskView
    private var performanceView: PerformanceView
    
    private var leftViewBottomConstraint: Constraint!
    private var rightViewBottomConstraint: Constraint!
    
    // MARK: Initializer
    public init(riskView: RiskView, performanceView: PerformanceView) {
        self.performanceView = performanceView
        self.riskView = riskView
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.scrollView
        ])
        
        self.scrollView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(70.0)
        }
        
        self.scrollView.subviews(forAutoLayout: [
            self.viewContainer
        ])
        
        self.viewContainer.backgroundColor = UIColor.lightGray
        
        self.viewContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        self.viewContainer.subviews(forAutoLayout: [
            self.leftView,
            self.rightView
        ])
        
        self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.leftViewWidth = make.width.equalTo(150.0).constraint
            self.leftViewHeight = make.height.equalTo(400.0).constraint
            make.top.equalToSuperview().offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
            self.leftViewBottomConstraint = make.bottom.equalToSuperview().inset(20.0).constraint
        }
        
        self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.rightViewWidth = make.width.equalTo(150.0).constraint
            self.rightViewHeight =  make.height.equalTo(400.0).constraint
            make.top.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            self.rightViewBottomConstraint =  make.bottom.equalToSuperview().inset(20.0).constraint
        }
        
        self.leftView.subviews(forAutoLayout: [
            self.riskView
        ])

        self.riskView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
        
        self.rightView.subviews(forAutoLayout: [
            self.performanceView
        ])
        
        self.performanceView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
        
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.morpheusViewWidth = self.bounds.width / 2 - 30
        
        self.expandedMorpheusHeight = self.frame.height / 2 - 50
        
        self.leftViewWidth.update(offset: self.morpheusViewWidth)
        self.rightViewWidth.update(offset: self.morpheusViewWidth)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    public func morphLeftView() {
        
        switch self.leftView.state {
        case .expanded:
            UIView.animate(withDuration: 1.0, animations: { [unowned self] in
                self.leftView.snp.removeConstraints()
                self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    self.leftViewWidth = make.width.equalTo(self.morpheusViewWidth).constraint
                    self.leftViewHeight = make.height.equalTo(400.0).constraint
                    make.top.equalToSuperview().offset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                }
                
                self.rightView.snp.removeConstraints()
                
                self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.width.equalTo(self.morpheusViewWidth)
                    make.height.equalTo(400.0)
                    make.top.equalToSuperview().offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                    make.bottom.equalToSuperview()
                }
                
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                
                self.layoutIfNeeded()
            }) { [unowned self] (completed: Bool) -> Void in
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(1.0)
                self.riskView.state = MorphingViewState.normal
                self.leftView.state = MorphingViewState.normal
            }
        case .normal:
            
            UIView.animate(withDuration: 1.0, animations: { [unowned self] in
                self.leftView.snp.removeConstraints()
                
                self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.height.equalTo(self.expandedMorpheusHeight)
                    make.top.equalToSuperview().offset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                }
                
                self.rightView.snp.removeConstraints()
                
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                
                self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.top.equalTo(self.leftView.snp.bottom).offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                    make.height.equalTo(600.0)
                    make.bottom.equalToSuperview().inset(20.0)
                }
                
                self.layoutIfNeeded()
                
            }) { [unowned self] (completed: Bool) -> Void in
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(1.0)
                self.leftView.state = MorphingViewState.expanded
                self.riskView.state = MorphingViewState.expanded
            }
        case .beneath:
            break
        }
    }
}

public class MorpheusView: UIView {
    
    // MARK: - Initializer
    public init(state: MorphingViewState = MorphingViewState.normal) {
        self.state = state
        super.init(frame: CGRect.zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Stored Properties
    public var state: MorphingViewState
}
