//
//  CommentModel.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
    
- (instancetype)initWithUserID:(NSString *)userID productID:(NSString *)productID userName:(NSString *)userName text:(NSString *)text{

    _userID = userID;
    _productID = productID;
    _userName = userName;
    _text = text;
    _userImageURLString = [NSString stringWithFormat: @"http://52.198.40.72/patissier/users/%@/picture.jpg", userID];

    return self;

}

@end
