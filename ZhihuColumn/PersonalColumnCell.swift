//
//  PersonalColumnCell.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class PersonalColumnCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = whiteColor
        return view
    }()
    
    let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 3
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = fontColor
        label.font = Font.font(size: 15)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 12)
        label.numberOfLines = 3
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 10)
        return label
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 10)
        return label
    }()
    
    var personalColumn = PersonalColumn() {
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
        backView.addSubview(self.contentLabel)
        backView.addSubview(self.likesLabel)
        backView.addSubview(self.nameLabel)
        
        backView.snp_makeConstraints { make in
            make.left.right.top.equalTo(self.contentView)
            make.height.greaterThanOrEqualTo(100)
            make.bottom.equalTo(self.contentView).offset(-10)
        }
        titleImageView.snp_makeConstraints { make in
            make.left.equalTo(leftSpace)
            make.centerY.equalTo(self.contentView)
            make.width.equalTo(100)
            make.height.equalTo(80)
        }
        titleLabel.snp_makeConstraints { make in
            make.left.equalTo(self.titleImageView.snp_right).offset(10)
            make.right.equalTo(self.backView).offset(-10)
            make.top.equalTo(self.backView).offset(10)
        }
        contentLabel.snp_makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp_bottom).offset(10)
            make.left.equalTo(self.titleLabel)
            make.right.equalTo(self.backView).offset(-10)
        }
        likesLabel.snp_makeConstraints { make in
            make.right.equalTo(self.backView).offset(-10)
            make.top.equalTo(self.nameLabel)
            make.left.greaterThanOrEqualTo(self.nameLabel.snp_right).offset(10)
        }
        nameLabel.snp_makeConstraints { make in
            make.left.equalTo(self.titleLabel)
            make.top.equalTo(self.contentLabel.snp_bottom).offset(10)
            make.bottom.lessThanOrEqualTo(self.backView).offset(-10)
        }
        
    }
    
    private func update() {
        if personalColumn.titleImage == "" {
            titleImageView.snp_updateConstraints { make in
                make.width.height.equalTo(0)
            }
        } else {
            titleImageView.kf_setImageWithURL(NSURL(string: personalColumn.titleImage))
        }
        titleLabel.text = personalColumn.title
        
        contentLabel.text = personalColumn.content
        nameLabel.text = "\(personalColumn.name) * \(personalColumn.publishedTime)"
        likesLabel.text = "\(personalColumn.likesCount)赞 * \(personalColumn.commentsCount)条评论"
    }
    
}
