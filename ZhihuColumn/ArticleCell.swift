//
//  ArticleCell.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/13.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = whiteColor
        return view
    }()
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = fontColor
        label.font = Font.font(size: 15)
        label.numberOfLines = 2
        return label
    }()
    
    let authorNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 12)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 12)
        return label
    }()
    
    var article = Article() {
        didSet {
            update()
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
        backgroundColor = appBackgroundColor
        
        contentView.addSubview(self.backView)
        backView.addSubview(self.titleImageView)
        backView.addSubview(self.titleLabel)
        backView.addSubview(self.authorNameLabel)
        backView.addSubview(self.nameLabel)
        
        backView.snp_makeConstraints { make in
            make.top.left.right.equalTo(0)
            make.bottom.equalTo(contentView).offset(-10)
            make.bottom.equalTo(self.authorNameLabel.snp_bottom).offset(10)
        }
        titleImageView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self.contentView)
            make.height.equalTo(self.titleImageView.snp_width).multipliedBy(0.33)
        }
        titleLabel.snp_makeConstraints { make in
            make.top.equalTo(self.titleImageView.snp_bottom).offset(20)
            make.left.equalTo(leftSpace)
            make.right.equalTo(-leftSpace)
        }
        authorNameLabel.snp_makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(contentView.snp_centerX)
        }
        nameLabel.snp_makeConstraints { make in
            make.top.equalTo(self.authorNameLabel)
            make.right.equalTo(contentView).offset(-10)
            make.left.greaterThanOrEqualTo(contentView.snp_centerX)
        }
        
    }
    
    private func update() {
        titleImageView.kf_setImageWithURL(NSURL(string: article.titleImage))
        titleLabel.text = article.title
        authorNameLabel.text = article.author.name
        if let name = article.name {
            nameLabel.text = "发表于 \(name)"
        }
    }
    
}
