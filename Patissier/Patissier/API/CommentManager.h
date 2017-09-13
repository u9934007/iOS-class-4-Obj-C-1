//
//  CommentManager.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/12.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "CommentModel.h"

@interface CommentManager: NSObject

@property (nonatomic) Boolean lastPage;

+(instancetype _Nullable )sharedInstance;

-(void) getCommentsForProductID:(NSString *_Nullable)productID withCompletionHandler:(void (^__nonnull)(NSMutableArray<CommentModel *> * __nullable commentArray, NSError * __nullable error)) completionHandler;
    
@end

