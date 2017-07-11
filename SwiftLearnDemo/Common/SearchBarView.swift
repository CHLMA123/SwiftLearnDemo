//
//  SearchBarView.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

enum SearchBarViewType {
    case home
    case video
    case imessage
    case other
}

@objc protocol SearchBarViewDelegate {
    
    @objc optional func scanAction()
    @objc optional func searchAction()
}

class SearchBarView: UIView ,UITextFieldDelegate {

    // 对外提供的属性
    weak var delegate:SearchBarViewDelegate?
    
    var viewType:SearchBarViewType?
    
    init(frame: CGRect, indexType:SearchBarViewType) {
        super.init(frame: frame)
        
        let viewType = indexType
        switch viewType {
        default:
            self.addSubview(searchField)
            searchField.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
            break
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("SearchBarView deinit")
    }
    
    lazy var searchField: UITextField = {
        let searchField = UITextField.init()
        searchField.layer.borderWidth = 0.5
        searchField.layer.borderColor = UIColor.clear.cgColor
        searchField.layer.cornerRadius = 2.5
        searchField.layer.masksToBounds = true
        searchField.delegate = self
        searchField.backgroundColor = UIColor.init(red: 224/255.0, green: 91/255.0, blue: 85/255.0, alpha: 1.0)
        searchField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        let leftBgView = UIView.init()
        leftBgView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchField.leftView = leftBgView
        
        let leftBgImgView = UIImageView.init(image: UIImage.init(named: "Icon"))
        leftBgImgView.frame = CGRect(x: 8, y: 5, width: 20, height: 20)
        leftBgView.addSubview(leftBgImgView)
        searchField.leftViewMode = UITextFieldViewMode.always
        
        let rightBgView = UIView.init()
        rightBgView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        searchField.rightView = rightBgView
        
        let rightBgBtn = UIButton(type: UIButtonType.custom)
        rightBgBtn.frame = CGRect(x: 0, y: 5, width: 20, height: 20)
        rightBgBtn.setBackgroundImage(UIImage.init(named: "Icon1"), for: UIControlState.normal)
        rightBgBtn.addTarget(self, action: #selector(leftScanButton(sender:)), for: UIControlEvents.touchUpInside)
        rightBgView.addSubview(rightBgBtn)
        searchField.rightViewMode = UITextFieldViewMode.always
        
        return searchField
    }()
    
    func leftScanButton(sender:UIButton) {
        delegate?.scanAction!()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchField.resignFirstResponder()
        delegate?.searchAction!()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
