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
    public let leftView: MorpheusView = {
        let view: MorpheusView = MorpheusView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    public let rightView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()
    
    public let button: NavigationButton = {
        let view: NavigationButton = NavigationButton()
        view.setTitle("Back", for: UIControl.State.normal)
        view.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        view.withAccesory(
            direction: NavigationButton.AccesoryDirection.left,
            image: #imageLiteral(resourceName: "left-arrow").withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
        )
        return view
    }()
    
    private var leftViewWidth: Constraint!
    private var leftViewHeight: Constraint!
    
    private var rightViewWidth: Constraint!
    private var rightViewHeight: Constraint!
    
    private var morpheusViewWidth: CGFloat!
    private var expandedMorpheusHeight: CGFloat!
    
    // MARK: Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: [
            self.leftView, self.rightView, self.button
        ])
        
        self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.leftViewWidth = make.width.equalTo(150.0).constraint
            self.leftViewHeight = make.height.equalTo(300.0).constraint
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
        }
        
        self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            self.rightViewWidth = make.width.equalTo(150.0).constraint
            self.rightViewHeight =  make.height.equalTo(300.0).constraint
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
        }
        
        self.button.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.bottom.equalToSuperview()
            make.width.equalTo(150.0)
            make.height.equalTo(60.0)
            make.centerX.equalToSuperview()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.morpheusViewWidth = self.frame.width / 3
        
        self.expandedMorpheusHeight = self.frame.height / 2 - 50
        
        self.leftViewWidth.update(offset: self.morpheusViewWidth)
        self.rightViewWidth.update(offset: self.morpheusViewWidth)
        
//        self.button.imageEdgeInsets = UIEdgeInsets(top: 5, left: (self.button.bounds.width - 35), bottom: 5, right: 5)
//        self.button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (self.button.imageView?.frame.width)!)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    public func morphLeftView() {
        
        switch self.leftView.isExpanded {
        case true:
            UIView.animate(withDuration: 1.0, animations: { [unowned self] in

                self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    self.leftViewWidth = make.width.equalTo(self.morpheusViewWidth).constraint
                    self.leftViewHeight = make.height.equalTo(300.0).constraint
                    make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                }

                self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.width.equalTo(self.morpheusViewWidth)
                    make.height.equalTo(300.0)
                    make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                }
                
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(0.5)

                self.layoutIfNeeded()
            }) { [unowned self] (completed: Bool) -> Void in
                self.leftView.isExpanded = false
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(1.0)
            }
            
        case false:
            UIView.animate(withDuration: 1.0, animations: { [unowned self] in
                self.leftView.snp.removeConstraints()
                
                self.leftView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.height.equalTo(self.expandedMorpheusHeight)
                    make.top.equalTo(self.safeAreaLayoutGuide).offset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                }
                
                self.rightView.snp.removeConstraints()
                
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(0.5)
                
                self.rightView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
                    make.top.equalTo(self.leftView.snp.bottom).offset(20.0)
                    make.trailing.equalToSuperview().inset(20.0)
                    make.leading.equalToSuperview().offset(20.0)
                    make.bottom.equalToSuperview().inset(20.0)
                }
                
                self.layoutIfNeeded()
                
            }) { [unowned self] (completed: Bool) -> Void in
                self.rightView.backgroundColor = UIColor.red.withAlphaComponent(1.0)
                self.leftView.isExpanded = true
            }
        }
    }
}

public class MorpheusView: UIView {
    
    public var isExpanded: Bool = false
    
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public class NavigationButton: UIButton {
    
    // MARK: - Enum Declaration
    public enum AccesoryDirection {
        case right
        case left
    }
    
    private var accesoryDirection: AccesoryDirection?
    
    // MARK: - Initializers
    public init() {
        super.init(frame: CGRect.zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle Methods
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if let direction = self.accesoryDirection {
            switch direction {
            case .left:
                break
            case .right:
                self.imageEdgeInsets = UIEdgeInsets(top: 5, left: (self.bounds.width - 35), bottom: 5, right: 5)
                self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (self.imageView?.frame.width)!)
            }
        }
    }

    // MARK: - Public API's
    public func withAccesory(direction: AccesoryDirection, image: UIImage) {
        self.setImage(image, for: UIControl.State.normal)
    }
}
