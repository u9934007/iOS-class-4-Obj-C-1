//
//  CommentModel.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
    
@property (strong, nonatomic, readonly) NSString *userID;
@property (strong, nonatomic, readonly) NSString *productID;
@property (strong, nonatomic, readonly) NSString *userName;
@property (strong, nonatomic, readonly) NSString *text;
@property (strong, nonatomic, readonly) NSString *userImageURLString;
    
- (instancetype)initWithUserID:(NSString *)userID productID:(NSString *)productID userName:(NSString *)userName text:(NSString *)text;
    
@end
