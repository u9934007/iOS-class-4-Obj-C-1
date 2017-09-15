//
//  ProductModel.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.


#import <Foundation/Foundation.h>

@interface ProductModel : NSObject
    
@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString *iD;
@property (nonatomic) NSString * price;
@property (strong, nonatomic) NSString *imageURLString;
- (instancetype)initWithTitle:(NSString *)title iD:(NSString *)iD price:(NSString * )price;
    
@end
