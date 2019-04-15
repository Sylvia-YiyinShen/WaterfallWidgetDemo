//
//  MyCollectionViewCell.swift
//  WaterfallLayoutDemo
//
//  Created by Zhihui Sun on 15/4/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
}

extension MyCollectionViewCell: WaterfallWidgetCellProtocol {
    func configure(with model: WaterfallWidgetCellModelProtocol) {
        if let model = model as? MyCollectionViewCellModel {
            imageView.image = UIImage(named: model.imageName)
        }
    }
}
