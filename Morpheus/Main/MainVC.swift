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
        self.view = CollectionMainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
       
        self.rootview.collectionView.register(
            SampleCell.self,
            forCellWithReuseIdentifier: SampleCell.identifier
        )
        
        self.rootview.collectionView.dataSource = self
        self.rootview.collectionView.delegate = self
    }
    
    // MARK: Stored Properties
    private var data: [CellViewModel] = [
        CellViewModel(),
        CellViewModel()
    ]
}




// MARK: - Views
extension MainVC {
    public unowned var rootview: CollectionMainView { return self.view as! CollectionMainView }
}

extension MainVC: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SampleCell.identifier,
                for: indexPath
            ) as? SampleCell
        else { return UICollectionViewCell() }
        
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var squareSize: CGFloat
        
        let selectedViewModel: CellViewModel = self.data[indexPath.item]
        
        switch selectedViewModel.isExpanded {
        case true:
            squareSize = self.rootview.collectionView.frame.width
        case false:
            squareSize = self.rootview.collectionView.frame.width / 2.1
        }

        return CGSize(
            width: squareSize,
            height: squareSize
        )
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedViewModel: CellViewModel = self.data[indexPath.item]
        selectedViewModel.isExpanded = true
        self.rootview.collectionView.reloadData()
        
        UIView.animate(withDuration: 1.0, animations: { [unowned self] in
                self.rootview.layoutIfNeeded()
        })
    }
    
}
