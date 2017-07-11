//
//  CarouselDataModel.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import Foundation

struct carouselDataModel {
    
    var title: String
    var imageUrl: String
    var link: String
    var target: String //target = push;
}

extension carouselDataModel {
    
    static func parseJson(ret:NSDictionary) -> carouselDataModel
    {
        guard let title1 = ret["title"] as? String else { fatalError("error parse title") }
        
        guard let imageUrl1 = ret["iphoneimg"] as? String else { fatalError("error parse imageUrl")  }
        
        guard let link1 = ret["link"] as? String else { fatalError("error parse link") }
        
        guard let target1 = ret["target"] as? String else { fatalError("error parse target") }
        
        return carouselDataModel(title: title1, imageUrl: imageUrl1, link: link1, target: target1)
    }
}
