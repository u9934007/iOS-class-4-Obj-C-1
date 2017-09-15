//
//  AppDelegate.h
//  Patissier
//
//  Created by Brady Huang on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCommentViewController.h"
#import "LandingViewController.h"
#import "ProfileTableViewController.h"
#import "ProductCollectionViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <IQKeyboardManager/IQKeyboardManager.h>


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UICollectionViewController *productCollectionViewController;


@property (strong, nonatomic) LandingViewController *landingViewController;

@property (strong, nonatomic) UICollectionViewController *test2;

@end
