//
//  CommentManager.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/12.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentManager.h"

@interface CommentManager ()

@property NSString *paging;
    
@end


@implementation CommentManager
    
    // Singleton
+(instancetype) sharedInstance {
    
    static CommentManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CommentManager alloc] init];
    });
    
    return instance;
}
    
-(void)getCommentsForProductID:(NSString *)productID withCompletionHandler:(void (^__nonnull)(NSMutableArray<CommentModel *> * __nullable commentArray, NSError * __nullable error)) completionHandler  {
    
    //userDefaultToken要從userDefault抓
    NSString *userDefaultToken = @"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiI1OTUyMWI2MWU2Y2I2MDE5ZjhjYjYwMTkiLCJleHAiOjE1MzY3NDgzMzcuMDM1LCJpYXQiOjE1MDUyMTIzMzcuMDM1OTYsImlzcyI6IjU5MjUxY2IxNDdkNTNiMDg1Y2EwNzY1NCIsInR5cGUiOiJhcHAiLCJ2ZXJzaW9uIjoiMS4wIn0.sgvobcV60oqz9J2yOQ-DtB6cnt1-hXVAObNjikJHryU";
    
    __block NSMutableArray<CommentModel*> *commentArray = [[NSMutableArray alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:  @"http://52.198.40.72/patissier/api/v1/products/%@/comments",productID];
    
    if (_paging != nil){
        
        urlString = [NSString stringWithFormat:  @"http://52.198.40.72/patissier/api/v1/products/%@/comments?paging=%@",productID, _paging];

    }
    
    NSLog(@"%@", urlString);
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: urlString ]];
    [request setHTTPMethod:@"GET"];
    [request addValue:[NSString stringWithFormat: @"Bearer %@", userDefaultToken] forHTTPHeaderField: @"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask =
    [
     session dataTaskWithRequest:request
     completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
         
         if (error) {
             completionHandler(nil, error);
         } else {
             NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
             
             switch (httpResponse.statusCode) {
                 case 200:
                 
                    commentArray = [self commentJSON:data];
                 
                    completionHandler(commentArray, nil);
                 
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
    
-(NSMutableArray<CommentModel *> *) commentJSON:(NSData *)data {
    
    NSMutableArray<CommentModel*> *commentArray = [[NSMutableArray alloc] init];
    
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
            
            NSString *productID = [item objectForKey:@"product_id"];
            NSString *text = [item objectForKey:@"text"];
            
            NSDictionary *user = [item objectForKey:@"user"];
            if (user == nil) {
                break;
            }
            
            NSString *userID = [user objectForKey:@"id"];
            NSString *userName = [user objectForKey:@"name"];
            
            CommentModel *comment = [[CommentModel alloc] initWithUserID:userID productID:productID userName:userName text:text];
            
            [commentArray addObject:comment];
        }
        
        NSString *next = [jsonObject objectForKey:@"next"];
        if (next == nil) {
            _lastPage = YES ;
        } else {
            
            _paging = next;
        
        }
    
    }
    
    return commentArray;
}
    
    
@end
