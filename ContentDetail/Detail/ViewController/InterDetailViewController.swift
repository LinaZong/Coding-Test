//
//  InterDetailViewController.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/11.
//

import UIKit
import ActiveLabel
class InterDetailViewController: UIViewController {
     let secreenW = UIScreen.main.bounds.width
     let secreenH = UIScreen.main.bounds.height
    
    fileprivate lazy var  infoLabel:ActiveLabel = {
        
        
        let label:ActiveLabel = ActiveLabel.init()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment  = NSTextAlignment.left
        label.textColor = UIColor.black
        label.enabledTypes = [.url]
        self.mainSc.addSubview(label)
        return label
    }()
    
    lazy var mainSc: UIScrollView = {
        let mainSc = UIScrollView(frame: CGRect.init(x: 0, y: 0, width: secreenW, height: secreenH))
        mainSc.backgroundColor = UIColor.white
        mainSc.showsHorizontalScrollIndicator = false
        mainSc.showsVerticalScrollIndicator = false
        mainSc.isPagingEnabled = false
        return mainSc
    }()
    
    var dataModel:DetailModel?{
        didSet{
            
            self.setupDataReloadView()
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        creatUIViews()
    }
    
    
    
    func creatUIViews()  {
        
        self.view.backgroundColor = UIColor.white
        self.title = "Detail"
        self.view .addSubview(mainSc)
        self.mainSc.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(0)
            make.top.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.bottom.equalToSuperview().offset(0)
        }
        self.infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.width.equalTo(secreenW - 20)
        }
    }
    
}

extension InterDetailViewController{

    func setupDataReloadView() {
        self.mainSc.contentSize = CGSize(width: 0, height: secreenH)
        guard self.dataModel!.type != "text-link" else {
            self.infoLabel.customize { label in
                label.text = self.dataModel!.content! + " "  + self.dataModel!.link!
                label.textColor = UIColor.black
                label.URLColor = UIColor(red: 65.0/255, green: 105.0/255, blue: 225.0/255, alpha: 1)
                label.handleURLTap {url  in
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
            
            return
        }
        
        self.infoLabel.text = self.dataModel!.content
        
        if self.dataModel?.type == "text-img"  || self.dataModel?.type == "img"{
            
            let imageUrlArr:[String] = self.dataModel?.imgUrls as![String]
            for (index,temp) in imageUrlArr.enumerated() {
                let imageView:UIImageView = UIImageView()
                imageView.sd_setImage(with: NSURL.init(string: temp) as URL?, completed: nil)
                self.mainSc.addSubview(imageView)
                imageView.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(10)
                    make.width.equalTo(secreenW - 20)
                    make.height.equalTo(150)
                    make.top.equalTo(self.infoLabel.snp.bottom).offset(20 + (index * 170))
                }
                
                
                
                
            }
            
            let imageHeigt:CGFloat = 200 * CGFloat(self.dataModel?.imgUrls?.count ?? 0)
            guard  imageHeigt < (secreenH / 2) else {
                return
            }
            self.mainSc.contentSize = CGSize(width: 0, height: (secreenH / 2) + imageHeigt)
            
        }
        
        
        
        
    }
}
