//
//  LandingViewController.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "LandingViewController.h"

@interface LandingViewController ()

@property CAGradientLayer *backgroundGradientLayer;

- (void) errorHandler:(void (^)(NSError* error))callbackBlock;

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
    
//    CAGradientLayer *layer = [CAGradientLayer layer];
    
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
    
    [self errorHandler:^(NSError *error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Something went wrong", "") message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", "") style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];

    }];
    
}


@end
