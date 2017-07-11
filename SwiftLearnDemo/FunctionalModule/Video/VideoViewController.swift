//
//  VideoViewController.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

enum FavorCellIndex:NSInteger {
    case Doc = 0,
    Post,
    HotEvent,
    News,
    Metting,
    Total
}

class VideoViewController: BaseViewController ,SearchBarViewDelegate, UITableViewDelegate, UITableViewDataSource{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createSearchBar()
        self.view.addSubview(favorTableView)
//        NetworkTools.requestData(.get, URLString: "http://zhekou.repai.com/jkjby/view/rp_b2c_list_v5.php?limit=100&&access_token=&appkey=100071&app_oid=2ad000dbe962fff914983edbf273b427&app_id=594792631&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo&pay=weixin&senddata=20150922") { (result) in
//            
//            print(result)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // favorTableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print("点击了第\(indexPath.row) 个cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return FavorCellIndex.Total.rawValue
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init()
        return view
        
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView.init()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavorTableViewCell", for: indexPath) as! FavorTableViewCell
        cell.backgroundColor = RGBA(r: Float(arc4random()%256), g: Float(arc4random()%230), b: Float(arc4random()%256), a: 0.35)
        cell.fillCellWithModel(index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 71
    }
    
    lazy var favorTableView: UITableView = {
        var favorTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: UITableViewStyle.grouped)
        favorTableView.backgroundColor = RGBA(r: 244, g: 243, b: 243, a: 1.0)
        favorTableView.delegate = self
        favorTableView.dataSource = self
        favorTableView.register(FavorTableViewCell.self, forCellReuseIdentifier: "FavorTableViewCell")
        favorTableView.tableFooterView = UIView.init()
        return favorTableView
    }()
    
    // createSearchBar
    func createSearchBar() -> Void {
        let titleView = SearchBarView.init(frame: CGRect(x: 0, y: 7, width: kScreenWidth - 20, height: 30), indexType: SearchBarViewType.home)
        titleView.delegate = self
        self.navigationItem.titleView = titleView
    }
    
    func scanAction() {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    func searchAction() {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
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
