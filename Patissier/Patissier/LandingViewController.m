//
//  LandingViewController.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//


#import "LandingViewController.h"
#import "ProductCollectionViewController.h"
#import "GradientNavigationViewController.h"

@interface LandingViewController ()

@property CAGradientLayer *backgroundGradientLayer;

@end

@implementation LandingViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBackgroundImageView];
    
    [self setUpBackgroundGradientView];
    
    [self setUpLogoLabel];
    
    [self setUpSignInWithFacebookButton];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _backgroundGradientLayer.frame = _backgroundGradientView.bounds;
    
}

- (void)setUpBackgroundImageView {
    
    _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    _backgroundImageView.image = [UIImage imageNamed: @"image-landing"];
    
}

- (void)setUpBackgroundGradientView {
    
    _backgroundGradientView.alpha = 0.85;
    
    _backgroundGradientLayer = [CAGradientLayer layer];
    
    CAGradientLayer *layer = _backgroundGradientLayer;
    
    layer.frame = self.view.bounds;
    
    layer.colors = @[(id)[UIColor colorWithRed: 3.0/255.0 green: 63.0/255.0 blue: 122.0/255.0 alpha: 1.0].CGColor,
                    (id)[UIColor colorWithRed: 4.0/255.0 green: 107.0/255.0 blue: 149.0/255.0 alpha: 1.0].CGColor];
    
    layer.endPoint = CGPointMake(0.5, 1.0);
    
    layer.startPoint = CGPointMake(0.5, 0.0);
    
    [_backgroundGradientView.layer insertSublayer:layer atIndex:0];
}

- (void)setUpLogoLabel {
    
    UILabel *label = _logoLabel;
    
    label.font = [UIFont fontWithName: @"Georgia-Bold" size:50.0];
    
    label.text = NSLocalizedString(@"Pâtissier", "");
    
    label.textAlignment = NSTextAlignmentCenter;
    
    label.textColor = [UIColor whiteColor];
    
    label.layer.shadowColor = [UIColor blackColor].CGColor;
    
    label.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    
    label.layer.shadowOpacity = 0.5;
    
    label.layer.shadowRadius = 2.0;
    
}

- (void)setUpSignInWithFacebookButton {
    
    UIButton *button = _signInWithFacebookButton;
    
    button.backgroundColor = [UIColor colorWithDisplayP3Red: 255.0 / 255.0 green: 53.0 / 255.0 blue: 71.0 / 255.0 alpha: 1.0];
    
    button.contentEdgeInsets = UIEdgeInsetsMake(12.0, 10.0, 12.0, 10.0);
    
    button.titleLabel.font = [UIFont systemFontOfSize: 16.0 weight:UIFontWeightBold];
    
    [button setTitle: NSLocalizedString(@"Sign In with Facebook", "") forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.layer.cornerRadius = 2.0;
    
    button.layer.shadowColor = [UIColor colorWithDisplayP3Red: 3.0 / 255.0 green: 63.0 / 255.0 blue: 122.0 / 255.0 alpha: 1.0].CGColor;
    
    button.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    
    button.layer.shadowOpacity = 1.0;
    
    button.layer.shadowRadius = 10.0;
    
}


- (IBAction)signInWithFacebook:(id)sender {
    
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];

    loginManager.loginBehavior = FBSDKLoginBehaviorBrowser;
    
    [loginManager logInWithReadPermissions:@[@"public_profile",@"email"] fromViewController: self handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        if (error)
        {
            NSLog(@"Process error");

            [self facebookLoginFailed:YES];

        } else if (result.isCancelled) {

            [self facebookLoginFailed:NO];
            
        } else {
            
            if ([FBSDKAccessToken currentAccessToken]) {
                
                [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, email, name, picture.type(large), link"}]
                 
                 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                     
                     if (!error) {
                         
                         NSLog(@"fetched user:%@", result);
                         
                         [[NSUserDefaults standardUserDefaults] setObject:[result valueForKeyPath:@"name"] forKey:@"name"];
                         
                         [[NSUserDefaults standardUserDefaults] setObject:[result valueForKeyPath:@"email"] forKey:@"email"];
                         
                         [[NSUserDefaults standardUserDefaults] setObject:[[[result valueForKeyPath:@"picture"]valueForKeyPath:@"data"] valueForKeyPath:@"url"]forKey:@"picture"];
                         [[NSUserDefaults standardUserDefaults] setObject:[[FBSDKAccessToken currentAccessToken]tokenString] forKey:@"token"];
                         
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
                        [self presentViewController:tabBarController animated:true completion:nil];

                     } else {

                         [self facebookLoginFailed:YES];

                         NSLog(@"%@",error);
                     }

                 }];
            }
            
        }
        
    }];
    
}

- (void)facebookLoginFailed:(BOOL)isFBResponce{
    if(isFBResponce){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Attention", nil) message:NSLocalizedString(@"request_error", nil) preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:alert completion:nil];
        
    } else{
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Attention", nil) message:NSLocalizedString(@"loginfb_cancelled", nil) preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:alert completion:nil];
        
    }
}


@end
