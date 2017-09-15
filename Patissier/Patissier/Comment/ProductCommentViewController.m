//
//  ProductCommentViewController.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/11.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProductCommentViewController.h"
#import "CommentModel.h"
#import "ProductInformationTableViewCell.h"
#import "SeperatorTableViewCell.h"
#import "CommentTableViewCell.h"
#import "Constants.h"
#import "CheckoutViewController.h"

@interface ProductCommentViewController () <UITableViewDataSource>

/*
typedef enum{
        
    productInformation,
        
    seperater,
        
    comments
        
}Component;
    
@property NSMutableArray<Component*>* component;

*/

@property NSMutableArray<CommentModel*> *commentArray;

@property bool isLoading;
    
@property CommentManager* commentManager;

    
@end

@implementation ProductCommentViewController
    
@synthesize product = _product;
    
- (id)initWithProduct: (ProductModel*)product{
    
        self = [super initWithStyle:UITableViewStyleGrouped];
    
        self.product = product;
    
        return self;

}
     
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setDefaultProperty];
        
    self.title = @"Product";
    
    [self setUpTableView];
    
    [self.commentManager getCommentsForProductID: self.product.iD withCompletionHandler:^(NSMutableArray<CommentModel *> * _Nullable commentArray, NSError * _Nullable error) {
        if (!error) {
            
            [self.commentArray addObjectsFromArray: commentArray];

        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.isLoading = false;
            [self.tableView reloadData];
        
        });
    
    }];
    
}

-(void)setDefaultProperty {
    
    self.commentArray = [[NSMutableArray alloc] init];
    
    self.commentManager = [CommentManager sharedInstance];
    
    self.isLoading = true;
    
}
    
- (void)setUpTableView {
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    UINib *productInformationNib = [UINib nibWithNibName: PRODUCTINFORMATION_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:productInformationNib forCellReuseIdentifier: PRODUCTINFORMATION_TABLEVIEW_CELL];
    
    UINib *speraterNib = [UINib nibWithNibName: SEPERATOR_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:speraterNib forCellReuseIdentifier:SEPERATOR_TABLEVIEW_CELL];
    
    UINib *commentNib = [UINib nibWithNibName: COMMENT_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:commentNib forCellReuseIdentifier: COMMENT_TABLEVIEW_CELL];

}
    
- (void)pressAddToCart {

    CheckoutViewController *checkoutViewController = [[CheckoutViewController alloc] initWithProduct: self.product];
    
    UINavigationController *checkoutNavigationController = [[UINavigationController alloc] initWithRootViewController: checkoutViewController ];
    
    [self presentViewController: checkoutNavigationController animated:YES completion:nil];
    
    
}
    
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!self.isLoading) {

        return self.commentArray.count + 2;
    
    } else {
        
        return 2;
    }

}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        
        return 133.0;
    
    } else if (indexPath.row == 1){
        
        return 19.0;
    
    } else {
        
        self.tableView.estimatedRowHeight = 105.0;
        
        return UITableViewAutomaticDimension;
    
    }
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        
        ProductInformationTableViewCell *cell = (ProductInformationTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ProductInformationTableViewCell" forIndexPath:indexPath];
        
        cell.productTitleLabel.text =  self.product.title;
        
        cell.productPriceLabel.text = [NSString stringWithFormat: @"$%zd", self.product.price];
        
        [cell.addToCartButton addTarget:self
                              action:@selector(pressAddToCart)
                              forControlEvents:UIControlEventTouchUpInside];
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.product.imageURLString]];
            if ( data != nil )
            {
            dispatch_async(dispatch_get_main_queue(), ^{
                // WARNING: is the cell still using the same data by this point??
                cell.productImageView.image = [UIImage imageWithData: data];
            });
            
            }
        });
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    } else if (indexPath.row == 1){
        
        SeperatorTableViewCell *cell = (SeperatorTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"SeperatorTableViewCell" forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
                
        return cell;
        
    } else {
        
        CommentTableViewCell *cell = (CommentTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
        
        cell.userNameLabel.text = self.commentArray[indexPath.row -2].userName;
        
        cell.commentContentLabel.text = self.commentArray[indexPath.row -2].text;
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.commentArray[indexPath.row -2].userImageURLString]];
            if ( data != nil )
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    // WARNING: is the cell still using the same data by this point??
                    cell.userImageView.image = [UIImage imageWithData: data];
                });
                
            }
        });

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;

    }


}
    
    
@end

