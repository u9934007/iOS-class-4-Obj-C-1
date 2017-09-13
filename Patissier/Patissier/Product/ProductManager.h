//
//  ProductManager.h
//  Patissier
//
//  Created by 戴其安 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProductModel.h"

@interface ProductManager: NSObject

@property (nonatomic) Boolean lastPage;

+(instancetype _Nullable )sharedInstance;

-(void) getProducts:(void (^__nonnull)(NSMutableArray<ProductModel *> * __nullable productArray, NSError * __nullable error)) completionHandler;

@end
