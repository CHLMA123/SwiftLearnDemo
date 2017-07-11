//
//  MeViewController.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

class MeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createNavigationView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createNavigationView() -> Void {
        let rightBtn = UIBarButtonItem.init(image: UIImage.init(named: "Album2"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightFindButton(sender:)))
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
