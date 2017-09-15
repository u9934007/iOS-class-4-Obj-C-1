//
//  CheckoutItemTableViewCell.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (weak, nonatomic) IBOutlet UILabel *productTitleLabel;
    
@property (weak, nonatomic) IBOutlet UILabel *productPriceLabel;
    
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@property (weak, nonatomic) IBOutlet UILabel *quantityLabel;
    
@end
