//
//  ColumnCell.swift
//  ZhihuColumn
//
//  Created by 季勤强 on 16/10/12.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ColumnCell: UITableViewCell {
    
    let backView: UIView = {
        let view = UIView()
        view.backgroundColor = whiteColor
        return view
    }()
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = fontColor
        label.font = Font.font(size: 15)
        return label
    }()
    
    let followerLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 12)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = textGrayColor
        label.font = Font.font(size: 12)
        label.numberOfLines = 2
        return label
    }()
    
    var column = Column() {
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
        self.backgroundColor = appBackgroundColor
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(toPeopleColumn))
        avatarImageView.addGestureRecognizer(tap)
        avatarImageView.userInteractionEnabled = true
        
        contentView.addSubview(self.backView)
        backView.addSubview(self.avatarImageView)
        backView.addSubview(self.nameLabel)
        backView.addSubview(self.followerLabel)
        backView.addSubview(self.descriptionLabel)
        
        backView.snp_makeConstraints { make in
            make.top.equalTo(10);
            make.left.equalTo(leftSpace)
            make.right.equalTo(-leftSpace)
            make.bottom.equalTo(self.descriptionLabel.snp_bottom).offset(10)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-10)
        }
        avatarImageView.snp_makeConstraints { make in
            make.centerY.equalTo(self.backView)
            make.left.equalTo(leftSpace)
            make.width.height.equalTo(50)
        }
        nameLabel.snp_makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(self.avatarImageView.snp_right).offset(10)
            make.right.equalTo(self.backView).offset(-10)
        }
        followerLabel.snp_makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp_bottom).offset(10)
            make.left.equalTo(self.nameLabel)
            make.height.equalTo(13)
        }
        descriptionLabel.snp_makeConstraints { make in
            make.top.equalTo(self.followerLabel.snp_bottom).offset(10)
            make.left.equalTo(self.nameLabel)
            make.right.equalTo(-10)
        }
        
    }
    
    private func update() {
        self.avatarImageView.kf_setImageWithURL(NSURL(string: column.avatar.URLString))
        self.nameLabel.text = column.name
        self.followerLabel.text = "\(column.followersCount) followers * \(column.postsCount)"
        self.descriptionLabel.text = column.description
    }
    
    
}

extension ColumnCell {
    
    func toPeopleColumn() {
        
        if let navigation = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController {
            let people = MainWebViewController()
            people.name = column.name
            people.URLString = URLStrings.getPeopleInfo(column.slug)
            navigation.pushViewController(people, animated: true)
        }
        
    }
    
}
