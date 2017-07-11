//
//  NetworkWrapper.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit
import Alamofire

// 网络请求超时时间
let NetworkTimeoutInterval:Double = 10

@objc protocol NetWrapperDelegate:NSObjectProtocol
{
    // TODO：研究 如果把result的类型改为Any会怎么样
    @objc optional func networkDidSuccess(result:AnyObject, requestName:String, parameters:NSDictionary?);
    @objc optional func networkDidFailed (result:AnyObject, error:Error?, requestName:String, parameters:NSDictionary?);
}

class NetworkWrapper: NSObject {
    var delegate:NetWrapperDelegate?
    static var sessionManager:SessionManager? = nil
    
    /// 闭包回调请求(类方法)
    ///
    /// - Parameters:
    ///   - method          : 请求方式 get、post...
    ///   - url             : 可以是字符串，也可以是URL
    ///   - parameters      : 参数字典
    ///   - finishedCallback: 完成请求的回调
    class func request(method:HTTPMethod, url:String, parameters:NSDictionary?, finishedCallback:  @escaping (_ result : AnyObject, _ error: Error?) -> ())
    {
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = NetworkTimeoutInterval
        sessionManager = SessionManager(configuration: config)
        
        Alamofire.request(url, method: method, parameters: parameters as? Parameters).responseJSON
            { (response) in
                let data = response.result.value
                if (response.result.isSuccess)
                {
                    finishedCallback(data as AnyObject, nil)
                }
                else
                {
                    finishedCallback(data as AnyObject,response.result.error)
                }
        }
    }
    
    /// 代理方法请求(类方法)
    ///
    /// - Parameters:
    ///   - method      : 请求方式 get、post...
    ///   - url         : 可以是字符串，也可以是URL
    ///   - requestName : 请求名字，一个成功的代理方法可以处理多个请求，所以用requestName来区分具体请求
    ///   - parameters  : 参数字典
    ///   - delegate    : 代理对象
    class func requestDelegate(method:HTTPMethod, url:String, requestName:String, parameters:NSDictionary?, delegate:AnyObject)
    {
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = NetworkTimeoutInterval
        sessionManager = SessionManager(configuration: config)
        Alamofire.request(url, method: method, parameters: parameters as? Parameters).responseJSON
            { (response) in
                let data = response.result.value
                if (response.result.isSuccess)
                {
                    delegate.networkDidSuccess?(result: (data as AnyObject), requestName: requestName, parameters: parameters)
                }
                else
                {
                    delegate.networkDidFailed?(result: (data as AnyObject), error:response.error, requestName: requestName, parameters: parameters)
                }
        }
    }
}
