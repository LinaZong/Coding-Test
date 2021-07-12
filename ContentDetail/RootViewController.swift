//
//  RootViewController.swift
//  ContentDetail
//
//  Created by 宗丽娜 on 2021/7/10.
//

import UIKit
class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Root"
        
        let entryBtn = UIButton(type: .system)
        entryBtn.setTitle("Entry", for: .normal)
        entryBtn.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        entryBtn.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
        view.addSubview(entryBtn)
        entryBtn.addTarget(self, action: #selector(jumpToListView), for: .touchUpInside)
    }
    
    @objc func jumpToListView() {
        // TODO
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}
