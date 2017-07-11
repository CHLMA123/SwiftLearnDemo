//
//  HomeViewController.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

private let IMAGE_HEIGHT:CGFloat = 210

let mCarouselViewUrl:String = "http://cloud.repaiapp.com/yunying/spzt.php?app_id=594792631&app_oid=2ad000dbe962fff914983edbf273b427&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo"
let mMarketUrl:String = "http://zhekou.repai.com/shop/discount/api/listnew1.php?app_id=594792631&app_oid=2ad000dbe962fff914983edbf273b427&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo&page=1"

class HomeViewController: BaseViewController ,SearchBarViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createSearchBar()
        self.createNavigationView()
        view.addSubview(tableView)
        tableView.addSubview(cycleScrollView)
        cycleScrollView.backgroundColor = UIColor.green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var carselDataArray:NSMutableArray?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestCarouselData()
    }

    func requestCarouselData()
    {
        NetApiContainer.requestCarouselData(reqName: "requestCarouselData", delegate: self)
    }
    
    func requestShopDiscount()
    {
        NetApiContainer.requestShopDiscount(reqName: "requestShopDiscount", delegate: self)
    }
    
    lazy var tableView:UITableView = {
        let table:UITableView = UITableView(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: Int(self.view.bounds.height)), style: .plain)
        table.contentInset = UIEdgeInsetsMake(IMAGE_HEIGHT, 0, 0, 0);
        table.showsVerticalScrollIndicator = false
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView.init()
        return table
    }()
    
    lazy var cycleScrollView:WRCycleScrollView = {
        let frame = CGRect(x: 0, y: -IMAGE_HEIGHT, width: CGFloat(kScreenWidth), height: IMAGE_HEIGHT)
        let cycleScrollView = WRCycleScrollView.init(frame: frame, type: ImgType.LOCAL, imgs: ["MessageImage1", "MessageImage3", "MessageImage1"], descs: ["channel", "doc", "community"])
        return cycleScrollView
    }()
    
    func createSearchBar() -> Void {
        let titleView = SearchBarView.init(frame: CGRect(x: 0, y: 7, width: kScreenWidth - 60, height: 30), indexType: SearchBarViewType.home)
        titleView.delegate = self
        self.navigationItem.titleView = titleView
    }
    
    func scanAction() {
        self.navigationController?.pushViewController(PushViewController(), animated: true)
    }
    
    func searchAction() {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
    func createNavigationView() -> Void {
        let rightBtn = UIBarButtonItem.init(image: UIImage.init(named: "Album2"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightFindButton(sender:)))
        self.navigationItem.rightBarButtonItem = rightBtn
    }
    
    func rightFindButton(sender:UIBarButtonItem) {
        
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

extension HomeViewController: UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: nil)
        let str = String(format: "MA %zd", indexPath.row)
        cell.textLabel?.text = str
        cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc:UIViewController = UIViewController()
        vc.view.backgroundColor = UIColor.red
        let str = String(format: "MA %zd", indexPath.row)
        vc.title = str
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: NetWrapperDelegate {
    
    func networkDidSuccess(result: AnyObject, requestName: String, parameters: NSDictionary?) {
        
        if (requestName == "requestCarouselData") {
            print(result)
            let ret: NSDictionary = (result as? NSDictionary)!
            let datas:NSArray = (ret["data"] as? NSArray)!
            
            carselDataArray = NSMutableArray.init()
            let k:Int = datas.count
            for index in 0..<k {
                let model:carouselDataModel = carouselDataModel.parseJson(ret: datas[index] as! NSDictionary)
                carselDataArray?.add(model)
            }
            // 数据解析完了
            print(carselDataArray?.count ?? 0)
            
            //            cycleScrollView.carselDataModelArr = carselDataArray as! [carouselDataModel]
            //            cycleScrollView.imgsType = .SERVER
            //            cycleScrollView.autoScrollInterval = 3
            //            cycleScrollView.reloadData()
        }
    }
    
    func networkDidFailed(result: AnyObject, error: Error?, requestName: String, parameters: NSDictionary?) {
        
        print(result.description + error.debugDescription)
    }
}
