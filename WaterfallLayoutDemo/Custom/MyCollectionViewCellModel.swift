//
//  MyCollectionViewCellModel.swift
//  WaterfallLayoutDemo
//
//  Created by Zhihui Sun on 15/4/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import Foundation
import UIKit

struct MyCollectionViewCellModel: WaterfallWidgetCellModelProtocol {
    var size: CGSize {
        get {
            return CGSize(width: width, height: height)
        }
    }
    
    var height: Int
    var width: Int
    var imageName: String
}
