//
//  ProfileInformationTableViewCell.h
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileInformationTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *placeholderImageView;

@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@property (weak, nonatomic) IBOutlet UIView *nameView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
