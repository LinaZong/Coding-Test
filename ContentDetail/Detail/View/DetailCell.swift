//
//  DetailCell.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import UIKit
import SDWebImage
import ActiveLabel
class DetailCell: UITableViewCell {
    
    //MARK: -- lazy
    /// introduce
    fileprivate lazy var  infoLabel:ActiveLabel = {
        
        let label:ActiveLabel = ActiveLabel.init()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        label.textAlignment  = NSTextAlignment.left
        label.textColor = UIColor.black
        label.enabledTypes = [.url]
      self.contentView.addSubview(label)
        return label
    }()
    
    
    /// image
    fileprivate lazy var  imagesUrlView:DetailImageView = {
        let imgView :DetailImageView = DetailImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.contentView.addSubview(imgView)
        return imgView
    }()

   
    fileprivate lazy var  showImage:UIImageView = {
        let img:UIImageView  = UIImageView()
        img.backgroundColor = UIColor.white
        imageView?.layer.cornerRadius = 10
        self.contentView.addSubview(img)
        img.isHidden = true
        return img
    }()
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createUI()
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}



//MARK: -- setValue
extension DetailCell{
//    Additional value
    func setData(model:DetailModel) {
        
        guard model.type != "text-link" else {
            self.infoLabel.customize { label in
                label.text = model.content! + " "  + model.link!
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
       
        self.infoLabel.text = model.content
        if model.type  == "text-img" {
            self.imagesUrlView.imageUrls = model.imgUrls as? [String]
        }else if  model.type == "img"{
            
            showImage.isHidden = false
            do {
                let imageUrl:String =  try model.imgUrls?[0] as! String
                self.showImage.sd_setImage(with: NSURL.init(string: imageUrl) as URL?, completed: nil)
                self.showImage.snp.makeConstraints { make in
                    make.height.equalTo(200)
                    make.bottom.equalToSuperview().offset(-10)
                }
            }
        }else {
            
            self.infoLabel.snp.makeConstraints { make in
                make.bottom.equalToSuperview().offset(-10)
            }
        }
    }
    
}



//MARK :-- createUI
extension DetailCell{
    fileprivate func createUI(){
        
        self.infoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        self.showImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        
        
        self.imagesUrlView.snp.makeConstraints({ make in
            make.left.equalToSuperview().offset(0)
            make.right.equalToSuperview().offset(0)
            make.top.equalTo(infoLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-10)
        })

    }

}
