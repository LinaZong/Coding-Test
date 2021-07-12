//
//  DetailViewController.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//


import UIKit
import SwiftyJSON
class DetailViewController: UIViewController {
    
    lazy var listTab: UITableView = {
        let listTab = UITableView(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        listTab.backgroundColor = UIColor.white
        listTab.delegate = self
        listTab.dataSource = self
        listTab.register(DetailCell.self, forCellReuseIdentifier:"DetailCell")
        return listTab
    }()
    
    var dataArray:[DetailModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        self.loadData()
      
     
       
        
        
        
    }
    
    /// createUI
    func createUI() {
        
        self.view.backgroundColor = UIColor.white
        self.title = "List"
        self.listTab.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(listTab)
        
    }

}

//MARK: tableView - Delegate
extension DetailViewController:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let listCell:DetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        if self.dataArray.count > indexPath.row {
            listCell.setData(model: self.dataArray[indexPath.row])
        }
        listCell.selectionStyle =  .none
        return listCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC:InterDetailViewController = InterDetailViewController ()
        if self.dataArray.count > indexPath.row {
            detailVC.dataModel = self.dataArray[indexPath.row]
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

//MARK: -- loadData
extension DetailViewController{
//    loaaData
    fileprivate func loadData(){
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
            let localData = NSData.init(contentsOfFile: path)! as Data
            do {
            
                  let jsonData =  try JSON(data: localData)
                let dataList:Array = jsonData["data"].arrayValue
                for item in dataList {
                    let model = DetailModel(jsonData: item)
                    self.dataArray.append(model)
                    }
                    self.listTab.reloadData()
           
               
              } catch {
                  debugPrint("json===ERROR")
              }
    }
    
}
