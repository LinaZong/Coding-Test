//
//  DetailModel.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import Foundation
import SwiftyJSON
class DetailModel: NSObject {
   
    var id: Int16?
    var type: String?
    var content:String?
    var link:String?
    
    var imgUrls:[Any]?


    init(jsonData: JSON) {
        id = jsonData["id"].int16
        content  = jsonData["content"].stringValue
        type  = jsonData["type"].stringValue
        link  = jsonData["link"].stringValue
        imgUrls  =  jsonData["imgUrls"].arrayObject
    }


}
