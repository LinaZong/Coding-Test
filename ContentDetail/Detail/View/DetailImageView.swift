//
//  DetailImageView.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import UIKit
import SnapKit
class DetailImageView: UIView {
    var colums:Int = 3
    var unitViewHeight:CGFloat = 80.0
    fileprivate var leftMargin:CGFloat = 0.0
    fileprivate var rightMargin:CGFloat = 0.0
    fileprivate var topMargin:CGFloat = 0.0
    fileprivate var bottomMargin:CGFloat = 0.0
    fileprivate var columsMargin:CGFloat = 0.0
    fileprivate var rowMargin:CGFloat = 0.0
   
    fileprivate var unitViewArray:[UIImageView] = []
    var imageUrls:[String]? {
        didSet{
            self.unitViewArray.removeAll()
            imageUrls!.forEach{ (temp) in
                let imageView:UIImageView = UIImageView()
                imageView.layer.cornerRadius = 5
                self.addSubview(imageView)
                imageView.sd_setImage(with: NSURL.init(string: temp) as URL?, completed: nil)
                self.unitViewArray.append(imageView)
                
            }
            self.layoutSubviews()
            
        }
    }
    
    
    
    override init(frame: CGRect) {
            super.init(frame: frame)
        self.initDefautData()
        }
  
    
    
    convenience init(frame: CGRect, imageURls:[String]) {
        
        self.init(frame:frame)
        imageUrls = imageUrls
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func createViews(){
        
        if self.unitViewArray.count > 1 {
            
            self.creatMoreImageViews()
            
        }else{
            
            if self.unitViewArray.count > 0 {
                let showImageView:UIImageView = self.unitViewArray[0]
                showImageView.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(15)
                    make.bottom.equalToSuperview().offset(-10)
                    make.right.equalToSuperview().offset(-15)
                    make.top.equalToSuperview().offset(5)
                    make.height.equalTo(150)
                }
            }
            
           
            
        }
        
    }
    
    
    
    override func layoutSubviews() {
        superview?.layoutSubviews()
        self.createViews()
    }
    
    
    fileprivate func creatMoreImageViews(){
        let spaceWith = self.leftMargin + self.rightMargin + (CGFloat(self.colums - 1) * CGFloat(self.columsMargin))
        let itemW = (self.bounds.size.width - spaceWith) / (CGFloat(self.colums))
        let itemH = self.unitViewHeight
       var row = 0,colum = 0
        
    
        for i in 0...self.unitViewArray.count - 1 {
  
                    row = i / self.colums
                    colum = i % self.colums
                 let leadingSpaceX = self.leftMargin + (self.columsMargin + itemW) * CGFloat(colum)
                    self.unitViewArray[i].snp.makeConstraints { (make) in
                        make.leading.equalToSuperview().offset(leadingSpaceX)
                        make.top.equalTo(self).offset((self.topMargin + (itemH + self.rowMargin)*CGFloat(row) ))
                        make.width.equalTo(itemW)
                        make.height.equalTo(itemH)
                        if i == self.unitViewArray.count - 1 {
                            make.bottom.equalTo(self.snp.bottom).offset(-self.bottomMargin)
                        }
                    }
                }

    }
    
    
    
    
        
    }
   
    
    

extension DetailImageView {
    
    func initDefautData() -> () {
        
        self.colums = 3
        self.leftMargin = 10.0
        self.rightMargin = 10.0
        self.topMargin = 10.0
        self.bottomMargin = 10.0
        self.columsMargin = 10.0
        self.rowMargin = 10.0
        
    }
    
}
