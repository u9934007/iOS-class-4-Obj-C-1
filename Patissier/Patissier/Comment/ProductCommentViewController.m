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

    
@end

@implementation ProductCommentViewController
    
- (id)initWithProduct: (ProductModel*)product{
    
        self = [super initWithStyle:UITableViewStyleGrouped];
    
        self.product = product;
    
        return self;
}
     
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TempInformation
        
    self.title = @"Product";
    
    self.isLoading = true;
    
    [self setUpTableView];
    
}
    
- (void)setUpTableView {

    UINib *productInformationNib = [UINib nibWithNibName: PRODUCTINFORMATION_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:productInformationNib forCellReuseIdentifier: PRODUCTINFORMATION_TABLEVIEW_CELL];
    
    UINib *speraterNib = [UINib nibWithNibName: SEPERATOR_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:speraterNib forCellReuseIdentifier:SEPERATOR_TABLEVIEW_CELL];
    
    UINib *commentNib = [UINib nibWithNibName: COMMENT_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:commentNib forCellReuseIdentifier: COMMENT_TABLEVIEW_CELL];

}
    
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
    
    
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!self.isLoading) {
    
        return _commentArray.count + 2;
    
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
    
        return UITableViewAutomaticDimension;
    
    }
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        
        ProductInformationTableViewCell *cell = (ProductInformationTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ProductInformationTableViewCell" forIndexPath:indexPath];
        
        cell.productTitleLabel.text =  [[NSString alloc] initWithFormat: @"%@", _product.title];
        
        cell.productPriceLabel.text = [[NSString alloc] initWithFormat: @"$%zd", _product.price];
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: _product.imageURLString]];
            if ( data != nil )
            {
            dispatch_async(dispatch_get_main_queue(), ^{
                // WARNING: is the cell still using the same data by this point??
                cell.productImageView.image = [UIImage imageWithData: data];
            });
            
            }
        });
        
        return cell;
        
    } else if (indexPath.row == 1){
        
        SeperatorTableViewCell *cell = (SeperatorTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"SeperatorTableViewCell" forIndexPath:indexPath];
                
        return cell;
        
    } else {
        
        CommentTableViewCell *cell = (CommentTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell" forIndexPath:indexPath];
        
        cell.userNameLabel.text = _commentArray[indexPath.row].userName;
        
        cell.commentContentLabel.text = _commentArray[indexPath.row].text;
        
        return cell;

    }


}
    
    
@end

