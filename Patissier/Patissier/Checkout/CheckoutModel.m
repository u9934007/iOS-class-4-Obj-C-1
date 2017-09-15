//
//  CheckoutModel.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/15.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//


#import "CheckoutModel.h"

@implementation CheckoutModel
    
- (instancetype)initWithCity:(NSString *)city postalCode:(NSString *)postalCode address:(NSString *)address firstName:(NSString *)firstName lastName:(NSString *)lastName title:(NSString *)title phoneNumber:(NSString *)phoneNumber cardNumber:(NSString *)cardNumber expMonth:(NSString *)expMonth expYear:(NSString *)expYear expCode:(NSString *)expCode{
    
    _city = city;
    _postalCode = postalCode;
    _address = address;
    _firstName = firstName;
    _lastName = lastName;
    _title = title;
    _phoneNumber = phoneNumber;
    _cardNumber = cardNumber;
    _expMonth = expMonth;
    _expYear = expYear;
    _expCode = expCode;
    
    return self;
}
    
@end
