//
//  ProfileSegmentedControlTableViewCell.h
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileSegmentedControlTableViewCell : UITableViewCell

typedef NS_ENUM(NSInteger, Segment){
    
    left,
    
    right
    
};

@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end
