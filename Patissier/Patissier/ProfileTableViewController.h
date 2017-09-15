//
//  ProfileTableTableViewController.h
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileInformationTableViewCell.h"
#import "ProfileSegmentedControlTableViewCell.h"

@interface ProfileTableViewController : UITableViewController

typedef NS_ENUM(NSInteger, ProfileComponent){
    
    information,
    
    segmentedControl,
    
    content,
    
    enumCount
    
};

@end
