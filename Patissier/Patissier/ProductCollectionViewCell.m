//
//  ProductCollectionViewCell.m
//  Patissier
//
//  Created by 戴其安 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProductCollectionViewCell.h"

@implementation ProductCollectionViewCell

@synthesize productNameLabel;
@synthesize productImageView;
@synthesize productBottomView;
@synthesize productPriceLabel;
@synthesize productHeartButton;

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor grayColor];
    
    self.productImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 152, 100)];
    self.productImageView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:productImageView];
    
    
    self.productBottomView = [[UIView alloc]initWithFrame:CGRectMake(6, 98, 142, 60.5) ];
    self.productBottomView.backgroundColor = [UIColor greenColor];
    [self.contentView addSubview:self.productBottomView];
    
    
    self.productNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 10, 126, 16) ];
    self.productNameLabel.backgroundColor = [UIColor orangeColor];
    [self.productBottomView addSubview:productNameLabel];
    
    self.productPriceLabel = [[UILabel alloc]initWithFrame:CGRectMake(42, 36, 92, 15)];
    self.productPriceLabel.backgroundColor = [UIColor blackColor];
    [self.productBottomView addSubview:productPriceLabel];
    
    
    self.productHeartButton = [[UIButton alloc]initWithFrame:CGRectMake(8, 34, 30, 20)];
    self.productHeartButton.backgroundColor = [UIColor whiteColor];
    [self.productBottomView addSubview:productHeartButton];
    
    
    
    
    return self;
}

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//
//        self.productNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 20) ];
//        self.productNameLabel.backgroundColor = [UIColor blueColor];
//
//    }
//
//    return self;
//}


@end
