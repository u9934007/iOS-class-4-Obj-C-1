//
//  CommentTableViewCell.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/12.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    _userImageView.layer.cornerRadius = _userImageView.frame.size.height/2;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
