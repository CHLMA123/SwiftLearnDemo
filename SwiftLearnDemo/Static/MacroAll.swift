//
//  MacroAll.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit
import Foundation

let kNavigationColor = UIColor.init(colorLiteralRed: 222/255.0, green: 81/255.0, blue: 222/255.0, alpha: 1.0)

let kNavBarHeigh  = 44.0
let kNavBarBottom = 64.0
let kTabBarHeight = 49.0

let kScreenWidth  = Int(UIScreen.main.bounds.width)
let kScreenHeight = Int(UIScreen.main.bounds.height)

let kIS_SCREEN_4_INCH = UIScreen.main.currentMode!.size  .equalTo(CGSize(width: 640, height: 1136))
let kIS_SCREEN_47_INCH = UIScreen.main.currentMode!.size .equalTo(CGSize(width: 750, height: 1334))
let kIS_SCREEN_55_INCH = UIScreen.main.currentMode!.size .equalTo(CGSize(width: 1242, height: 2208))

func RGBA(r:Float, g:Float, b:Float, a:Float) -> UIColor {
    return UIColor.init(colorLiteralRed: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func is_iOS8Later() -> Bool {
    return (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
}

// MARK: - 自定义打印方法
func MALogger<T>(_ message : T, file : String = #file, funcName: String = #function, lineNum : Int = #line ){
    #if DEBUG
        let filename = (file as NSString).lastPathComponent
        print("\(filename):(\(lineNum))——\(message)")
    #endif
}

