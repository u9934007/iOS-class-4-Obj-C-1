//
//  ProductModel.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.


#import "ProductModel.h"

@implementation ProductModel
    
- (instancetype)initWithTitle:(NSString *)title iD:(NSString *)iD price:(int *)price{
    
    _title = title;
    _iD = iD;
    _price = price;
    _imageURLString = [[NSString alloc] initWithFormat: @"http://52.198.40.72/patissier/products/%@/preview.jpg", iD];
    
    return self;
    
}
    
    @end
