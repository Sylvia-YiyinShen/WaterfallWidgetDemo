//
//  ViewController.swift
//  WaterfallLayoutDemo
//
//  Created by Sylvia Shen on 15/4/19.
//  Copyright © 2019 Sylvia Shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var waterfallWidget: WaterfallWidget!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWaterfallWidget()
    }

    private func configureWaterfallWidget() {
        let cellModels = [
            MyCollectionViewCellModel(height: 100, width: 200, imageName: "cat_01"),
            MyCollectionViewCellModel(height: 100, width: 100, imageName: "cat_02"),
            MyCollectionViewCellModel(height: 100, width: 220, imageName: "cat_04"),
            MyCollectionViewCellModel(height: 120, width: 100, imageName: "cat_03"),
            MyCollectionViewCellModel(height: 100, width: 200, imageName: "cat_02"),
            MyCollectionViewCellModel(height: 100, width: 100, imageName: "cat_01"),
            MyCollectionViewCellModel(height: 120, width: 100, imageName: "cat_03"),
            MyCollectionViewCellModel(height: 100, width: 220, imageName: "cat_04")
        ]
        waterfallWidget.configure(models: cellModels, customCellNib: UINib(nibName: "MyCollectionViewCell", bundle: .main), backgroundColor: UIColor.black)
        
//        waterfallWidget.columnCount = 3
//        waterfallWidget.sectionInset = UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50)
//        waterfallWidget.minimumColumnSpacing = 30
//        waterfallWidget.minimumInteritemSpacing = 40
    }

}
