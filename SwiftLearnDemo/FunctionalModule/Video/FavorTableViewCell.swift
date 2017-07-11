//
//  FavorTableViewCell.swift
//  SwiftLearnDemo
//
//  Created by CHLMA2015 on 2017/7/11.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

import UIKit

class FavorTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.lightGray
        self.selectionStyle = UITableViewCellSelectionStyle.none
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() -> Void {
        
        self.contentView.addSubview(typeImageView)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(bottomLine)
    }
    
    func fillCellWithModel(index:IndexPath) {
        
        self.typeImageView.image = UIImage.init(named: "attach_default_post")
        self.titleLabel.text = "嗯哼 \(index.section)部分"
        self.contentLabel.text = "嗯哼 \(index.row)行"
    }
    
    lazy var typeImageView: UIImageView = {
        let typeImageView = UIImageView.init(frame: CGRect(x: 17, y: 12, width: 47, height: 47))
        typeImageView.layer.cornerRadius = 2
        typeImageView.clipsToBounds = true
        return typeImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel.init(frame: CGRect(x: 17+47+12, y: 12, width: kScreenWidth - 76-17, height: 25))
        titleLabel.textColor = RGBA(r: 51, g: 51, b: 51, a: 1)
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    lazy var contentLabel: UILabel = {
        let contentLabel = UILabel.init(frame: CGRect(x: 17+47+12, y: 12+25, width: kScreenWidth-76-17, height: 22))
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.textColor = RGBA(r: 170, g: 170, b: 170, a: 1)
        contentLabel.textAlignment = NSTextAlignment.left
        contentLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        return contentLabel
    }()
    
    lazy var bottomLine: UIView = {
        let bottomLine = UIView.init(frame: CGRect(x: Double(kScreenWidth - 338), y: 70.5, width: 338, height: 0.5))
        bottomLine.backgroundColor = UIColor.brown
        return bottomLine
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
