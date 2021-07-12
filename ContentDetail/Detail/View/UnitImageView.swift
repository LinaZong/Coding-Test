//
//  UnitImageView.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import UIKit

class UnitView: UIImage {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.textAlignment = .center
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
