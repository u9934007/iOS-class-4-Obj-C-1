//
//  AppDelegate.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "AppDelegate.h"
#import "ProductModel.h"
#import "GradientNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    

    
    
    
    
    
    
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    ProductModel *product = [[ProductModel alloc] initWithTitle:@"巧克力杯子蛋糕" iD:@"5947974173a7f08ded3e8269" price: 120];
//    
//    ProductCommentViewController *vc = [[ProductCommentViewController alloc] initWithProduct: product];
//    self.window.rootViewController = vc;
//
////    LandingViewController *landingViewController = [[UIStoryboard storyboardWithName: @"Landing" bundle:nil] instantiateViewControllerWithIdentifier: @"LandingViewController"];
////
////    self.window.rootViewController = landingViewController;
//
//    [self.window makeKeyAndVisible];

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    

    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"token"]) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
        layout.itemSize = CGSizeMake(154, 160);
        
        layout.minimumLineSpacing = 22;
        
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
        
        ProductCollectionViewController *productCollectionViewController = [[ProductCollectionViewController alloc]initWithCollectionViewLayout:layout];
        
        GradientNavigationViewController *storeNavigationController = [[GradientNavigationViewController alloc]initWithRootViewController:productCollectionViewController];
        
        UIViewController *profileViewController = [[UIViewController alloc]init ];
        
        GradientNavigationViewController *profileNavigationController = [[GradientNavigationViewController alloc]initWithRootViewController:profileViewController];
        
        UITabBarController *tabBarController = [[UITabBarController alloc]init];
        
        [storeNavigationController.tabBarItem initWithTitle:@"Store" image:[UIImage imageNamed:@"icon-store"] tag:0];
        [profileNavigationController.tabBarItem initWithTitle:@"Profile" image:[UIImage imageNamed:@"icon-profile"] tag:1];
        
        
        
        NSArray *tabBarControllers = [[NSArray alloc]initWithObjects:storeNavigationController, profileNavigationController, nil];
        
        [tabBarController setViewControllers:tabBarControllers ];
        self.window.rootViewController = tabBarController;
        
self.window.rootViewController = tabBarController;
//        self.window.rootViewController = vc;
        
    } else {
    
        LandingViewController *landingViewController = [[UIStoryboard storyboardWithName: @"Landing" bundle:nil] instantiateViewControllerWithIdentifier: @"LandingViewController"];
        
        self.window.rootViewController = landingViewController;
        
    }

    [self.window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                               annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                    ];
    // Add any custom logic here.
    return handled;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBSDKAppEvents activateApp];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
