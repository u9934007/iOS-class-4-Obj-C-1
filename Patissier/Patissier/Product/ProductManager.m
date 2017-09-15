//
//  ProductManager.m
//  Patissier
//
//  Created by 戴其安 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductManager.h"

@interface ProductManager ()

@property NSString *paging;

@end


@implementation ProductManager

// Singleton
+(instancetype) sharedInstance {
    
    static ProductManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ProductManager alloc] init];
    });
    
    return instance;
}


-(void)getProducts:(void (^)(NSMutableArray<ProductModel *> * _Nullable, NSError * _Nullable))completionHandler {
    NSLog(@"getting product");
    NSString *userDefaultToken = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI1OTUyMWI2MWU2Y2I2MDE5ZjhjYjYwMTkiLCJleHAiOjE1MzY3NDgzMzcuMDM1LCJpYXQiOjE1MDUyMTIzMzcuMDM1OTYsImlzcyI6IjU5MjUxY2IxNDdkNTNiMDg1Y2EwNzY1NCIsInR5cGUiOiJhcHAiLCJ2ZXJzaW9uIjoiMS4wIn0.sgvobcV60oqz9J2yOQ-DtB6cnt1-hXVAObNjikJHryU";
    __block NSMutableArray<ProductModel*> *productArray = [[NSMutableArray alloc]init];
   
    NSString *urlString = [NSString stringWithFormat:@"http://52.198.40.72/patissier/api/v1/products"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [request setHTTPMethod:@"GET"];
    [request addValue:[NSString stringWithFormat: @"Bearer %@", userDefaultToken] forHTTPHeaderField: @"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask =
    [
     session dataTaskWithRequest:request
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         NSLog(@"requesting");
         if (error) {
             completionHandler(nil, error);
         } else {
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
             
             switch (httpResponse.statusCode) {
                 case 200:
                     NSLog(@"parsing");
                     productArray = [self productJSON:data];
                     
                     completionHandler(productArray, nil);
                     
                     break;
                     
                 default:
                     
                     NSLog(@"httpResponse statusCode is not 200.");
                     
                     break;
                     
             }
         }
     }
     ];
    
    [dataTask resume];

    


}



-(NSMutableArray<ProductModel *> *) productJSON:(NSData *)data {
    
    NSMutableArray<ProductModel*> *productArray = [[NSMutableArray alloc] init];
    
    NSError *jsonError;
    NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
    
    if (jsonError) {
        
        // Error Parsing JSON
        NSLog(@"===Error: %@", jsonError);
        
    } else {
        
        // Success Parsing JSON
        NSDictionary *jsonObject = (NSDictionary *)jsonResponse;
        if (jsonObject == nil) {
            return nil;
        }
        
        NSArray *data = [jsonObject objectForKey:@"data"];
        if (data == nil) {
            return nil;
        }
        
        for (NSDictionary *item in data) {
            
            NSString *productID = [item objectForKey:@"id"];
            NSString *productName = [item objectForKey:@"name"];
            NSString *productPrice = [item objectForKey:@"price"];
            NSLog(@"%@",productPrice);
            ProductModel * product = [[ProductModel alloc]initWithTitle:productName iD:productID price:productPrice];
                        [productArray addObject:product];
        }
        
        NSString *next = [jsonObject objectForKey:@"next"];
        if (next == nil) {
            _lastPage = YES ;
        } else {
            
            _paging = next;
            
        }
        
    }
    
    return productArray;
}


@end
