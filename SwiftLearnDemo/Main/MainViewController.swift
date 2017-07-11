//
//  MainViewController.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBar.tintColor = kNavigationColor
        self.viewControllers = [
            self.homeDetailNav(),
            self.videoDetailNav(),
            self.foundDetailNav(),
            self.IMDetailNav(),
            self.MeDetailNav(),
        ]
        //self.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func homeDetailNav() -> BaseNavigationController {
        let homeVC = HomeViewController()
        homeVC.title = "首页"
        let homeNav = BaseNavigationController.init(rootViewController: homeVC)
        homeNav.tabBarItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "Album"), selectedImage: UIImage.init(named: "Album_Selected"))
        homeNav.navigationBar.barTintColor = kNavigationColor
        homeNav.navigationBar.tintColor = UIColor.white
        homeNav.navigationBar.isTranslucent = true
        return homeNav
    }
    
    func videoDetailNav() -> BaseNavigationController {
        let videoVC = VideoViewController()
        videoVC.title = "视频"
        let videoNav = BaseNavigationController.init(rootViewController: videoVC)
        videoNav.tabBarItem = UITabBarItem.init(title: "视频", image: UIImage.init(named: "Album2"), selectedImage: UIImage.init(named: "Album2_Selected"))
        videoNav.navigationBar.barTintColor = kNavigationColor
        videoNav.navigationBar.tintColor = UIColor.white
        videoNav.navigationBar.isTranslucent = true
        return videoNav
    }
    
    func foundDetailNav() -> BaseNavigationController {
        let foundVC = foundViewController()
        foundVC.title = "发现"
        let foundNav = BaseNavigationController.init(rootViewController: foundVC)
        foundNav.tabBarItem = UITabBarItem.init(title: "发现", image: UIImage.init(named: "Album3"), selectedImage: UIImage.init(named: "Album3_Selected"))
        foundNav.navigationBar.barTintColor = kNavigationColor
        foundNav.navigationBar.tintColor = UIColor.white
        foundNav.navigationBar.isTranslucent = true
        return foundNav
    }
    
    func IMDetailNav() -> BaseNavigationController {
        let IMVC = IMessageViewController()
        IMVC.title = "消息"
        let IMNav = BaseNavigationController.init(rootViewController: IMVC)
        IMNav.tabBarItem = UITabBarItem.init(title: "消息", image: UIImage.init(named: "Message"), selectedImage: UIImage.init(named: "Message_Dot"))
        IMNav.navigationBar.barTintColor = kNavigationColor
        IMNav.navigationBar.tintColor = UIColor.white
        IMNav.navigationBar.isTranslucent = true
        return IMNav
    }
    
    func MeDetailNav() -> BaseNavigationController {
        let MeVC = MeViewController()
        MeVC.title = "我"
        let MeNav = BaseNavigationController.init(rootViewController: MeVC)
        MeNav.tabBarItem = UITabBarItem.init(title: "我", image: UIImage.init(named: "Icon1"), selectedImage: UIImage.init(named: "Icon1_"))
        MeNav.navigationBar.barTintColor = kNavigationColor
        MeNav.navigationBar.tintColor = UIColor.white
        MeNav.navigationBar.isTranslucent = true
        return MeNav
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
