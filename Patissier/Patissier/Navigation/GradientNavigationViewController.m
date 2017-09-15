//
//  NavigationViewController.m
//  Patissier
//
//  Created by 戴其安 on 2017/9/15.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "GradientNavigationViewController.h"

@interface GradientNavigationViewController ()

@end

@implementation GradientNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc]init];
    CGRect updatedFrame = self.navigationBar.bounds;
    updatedFrame.size.height = updatedFrame.size.height + 20;
    gradientLayer.frame = updatedFrame;
    
    
    NSArray *colorArray = [[NSArray alloc]initWithObjects:[UIColor colorWithRed:3/255.0 green:63/255.0 blue:122/255.0 alpha:1].CGColor ,[UIColor colorWithRed:4/255.0 green:107/255.0 blue:149/255.0 alpha:1].CGColor, nil];
    gradientLayer.colors = colorArray;
    
    
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1.0, 0.5);
    
    UIGraphicsBeginImageContext(gradientLayer.bounds.size);
    [gradientLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *gradientImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationBar setBackgroundImage:gradientImage forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    [self.navigationBar setTitleTextAttributes: [NSDictionary dictionaryWithObject: [UIColor whiteColor] forKey: NSForegroundColorAttributeName]];

        
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
