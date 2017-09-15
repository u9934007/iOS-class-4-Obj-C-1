//
//  CheckoutModel.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/15.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckoutModel : NSObject

@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postalCode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *cardNumber;
@property (strong, nonatomic) NSString *expMonth;
@property (strong, nonatomic) NSString *expYear;
@property (strong, nonatomic) NSString *expCode;
    
- (instancetype)initWithCity:(NSString *)city postalCode:(NSString *)postalCode address:(NSString *)address firstName:(NSString *)firstName lastName:(NSString *)lastName title:(NSString *)title phoneNumber:(NSString *)phoneNumber cardNumber:(NSString *)cardNumber expMonth:(NSString *)expMonth expYear:(NSString *)expYear expCode:(NSString *)expCode;
    
@end

