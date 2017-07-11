//
//  IMessageViewController.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

class IMessageViewController: BaseViewController ,SearchBarViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createSearchBar()
        self.createNavigationView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSearchBar() -> Void {
        let titleView = SearchBarView.init(frame: CGRect(x: 0, y: 7, width: kScreenWidth - 60, height: 30), indexType: SearchBarViewType.home)
        titleView.delegate = self as! SearchBarViewDelegate
        self.navigationItem.titleView = titleView
    }
    
    func scanAction() {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    func searchAction() {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    func createNavigationView() -> Void {
        let rightBtn = UIBarButtonItem.init(image: UIImage.init(named: "Message"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightFindButton(sender:)))
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func rightFindButton(sender:UIBarButtonItem) {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
