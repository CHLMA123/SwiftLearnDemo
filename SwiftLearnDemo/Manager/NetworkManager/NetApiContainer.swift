//
//  NetApiContainer.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit
import Alamofire

let BaseURL:String = "http://cloud.repaiapp.com/"

class NetApiContainer: NSObject {
    /// 二次封装的一个网络请求
    ///
    /// - Parameters:
    ///   - url         : 当前接口需要的 URL
    ///   - requestName : 请求名称
    ///   - delegate    : 处理网络请求成功和失败的代理
    ///   - param       : 请求参数                    可选参数，默认为nil
    ///   - method      : 网络请求类型                 可选参数，默认为 Get 请求方式
    class func MARequest(url:String, requestName:String, delegate:NetWrapperDelegate, param:NSDictionary? = nil, method: HTTPMethod? = .get)
    {
        NetworkWrapper.requestDelegate(method: .get, url: url, requestName: requestName, parameters: nil, delegate: delegate)
    }
}

// MARK: - 所有接口的集合
extension NetApiContainer {
    // 首页轮播广告图
    class func requestCarouselData(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = "http://cloud.repaiapp.com/yunying/spzt.php?app_id=594792631&app_oid=2ad000dbe962fff914983edbf273b427&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo"
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    // 首页商品详情页
    class func requestShopDiscount(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = BaseURL.appending("shop/discount/api/listnew1.php?app_id=594792631&app_oid=2ad000dbe962fff914983edbf273b427&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo&page=1")
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    // 视频页详情
    class func requestLatestDetails(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = BaseURL.appending("jkjby/view/rp_b2c_list_v5.php?limit=100&&access_token=&appkey=100071&app_oid=2ad000dbe962fff914983edbf273b427&app_id=594792631&app_version=1.1.1&app_channel=iphoneappstore&shce=miguo&pay=weixin&senddata=20150922")
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    // 启动页闪屏
    class func requestSplashImage(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = BaseURL.appending("7/prefetch-launch-images/1080*1920")
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    // App版本检测
    class func requestAppVersion(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = BaseURL.appending("7/version/ios/2.3.0")
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    // 最新消息
    class func requestLatestNews(reqName:String, delegate:NetWrapperDelegate)
    {
        let curURL = BaseURL.appending("4/news/latest")
        MARequest(url: curURL, requestName: reqName, delegate: delegate)
    }
    
    
}
