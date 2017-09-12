//
//  CommentTableViewCell.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/12.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
    
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
    
@property (weak, nonatomic) IBOutlet UILabel *commentContentLabel;
    
@end
