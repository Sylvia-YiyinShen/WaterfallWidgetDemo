//
//  WaterfallWidget.swift
//  WaterfallLayoutDemo
//
//  Created by Sylvia Shen on 15/4/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import Foundation
import UIKit

public class WaterfallWidget: UIView {
    private var collectionView: UICollectionView?
    private var layout = WaterfallLayout()
    private var cellModels: [WaterfallWidgetCellModelProtocol]?
    private var cellNib: UINib?
    private var widgetBackgroundColor: UIColor?
    
    public var columnCount: Int? {
        didSet {
            if let columnCount = columnCount {
                layout.columnCount = columnCount
            }
        }
    }
    
    public var minimumColumnSpacing: CGFloat? {
        didSet {
            if let minimumColumnSpacing = minimumColumnSpacing {
                layout.minimumColumnSpacing = minimumColumnSpacing
            }
        }
    }
    
    public var minimumInteritemSpacing: CGFloat? {
        didSet {
            if let minimumInteritemSpacing = minimumInteritemSpacing {
                layout.minimumInteritemSpacing = minimumInteritemSpacing
            }
        }
    }
    
    public var sectionInset: UIEdgeInsets? {
        didSet {
            if let sectionInset = sectionInset {
                layout.sectionInset = sectionInset
            }
        }
    }
    
    
    public var itemRenderDirection: WaterfallLayoutItemRenderDirection? {
        didSet {
            if let itemRenderDirection = itemRenderDirection {
                layout.itemRenderDirection = itemRenderDirection
            }
        }
    }
    
    func configure(models: [WaterfallWidgetCellModelProtocol], customCellNib: UINib, backgroundColor: UIColor = UIColor.black) {
        cellModels = models
        cellNib = customCellNib
        widgetBackgroundColor = backgroundColor
        configureCollectionView()
    }
    
    private func configureCollectionView() {
    
        // Create a waterfall layout
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = widgetBackgroundColor
        
        //register cell
        collectionView?.register(cellNib, forCellWithReuseIdentifier: "Cell")
        
        addSubview(collectionView!)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        collectionView?.frame = bounds
    }
}

extension WaterfallWidget: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellModels?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let widgetCell = cell as? WaterfallWidgetCellProtocol, let model = cellModels?[indexPath.row] {
            widgetCell.configure(with: model)
        }
        return cell
    }
}


extension WaterfallWidget: WaterfallLayoutDelegate {
    
    public func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                         sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return cellModels?[indexPath.row].size ?? CGSize.zero
    }
}
