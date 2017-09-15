//
//  CheckoutViewController.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductModel.h"

@interface CheckoutViewController : UIViewController

@property ProductModel* product;

- (id)initWithProduct: (ProductModel*)product;

@end
