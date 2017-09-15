//
//  ProfileInformationTableViewCell.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProfileInformationTableViewCell.h"

@implementation ProfileInformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setUpPlaceholderImageView];
    
    [self setUpPictureImageView];
    
    [self setUpNameView];
    
    [self setUpNameLabel];
}

- (void)setUpPlaceholderImageView {

    _placeholderImageView.backgroundColor = [UIColor whiteColor];
    
    _placeholderImageView.contentMode = UIViewContentModeCenter;
    
    _placeholderImageView.image = [[UIImage imageNamed: @"icon-placeholder"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    _placeholderImageView.tintColor = [UIColor colorWithRed: 165.0 / 255.0
                                                      green: 170.0 / 255.0
                                                       blue: 178.0 / 255.0
                                                      alpha: 1.0];
    
}

- (void)setUpPictureImageView {
    
    _pictureImageView.clipsToBounds = true;
    
    _pictureImageView.contentMode = UIViewContentModeScaleToFill;
    
}

- (void)setUpNameView {
    
    _nameView.backgroundColor = [UIColor colorWithRed: 82.0 / 255.0
                                                green: 66.0 / 255.0
                                                 blue: 64.0 / 255.0
                                                alpha: 0.75];
    
}

- (void)setUpNameLabel {
    
    _nameLabel.font = [UIFont fontWithName: @"Georgia" size: 18.0];
    
    _nameLabel.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    _nameLabel.layer.shadowRadius = 2.0;
    
    _nameLabel.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    
    _nameLabel.layer.shadowOpacity = 0.5;
    
    _nameLabel.text = NULL;
    
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    
    _nameLabel.textColor = [UIColor whiteColor];
    
}

@end
