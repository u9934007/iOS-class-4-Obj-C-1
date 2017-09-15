//
//  ProductCollectionViewCell.h
//  Patissier
//
//  Created by 戴其安 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UILabel *productNameLabel;
@property (strong, nonatomic) UIImageView *productImageView;
@property (strong, nonatomic) UIView *productBottomView;
@property (strong, nonatomic) UILabel *productPriceLabel;
@property (strong, nonatomic) UIButton *productHeartButton;



@end
