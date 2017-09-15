//
//  CheckoutViewController.m
//  Patissier
//
//  Created by 楊采庭 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "CheckoutViewController.h"
#import "CheckoutBottonView.h"
#import "CheckoutTableViewCell.h"
#import "CheckoutItemTableViewCell.h"
#import "Constants.h"


@interface CheckoutViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;
    
@property (strong,nonatomic) CheckoutBottonView *bottonView;

@end

@implementation CheckoutViewController
    
- (id)initWithProduct: (ProductModel*)product{
    
    self = [super init];
    
    self.product = product;
    
    return self;
    
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self setUpDefaultProperty];
    
    [self setUpBottonViewLayout];
    
    [self setUpTableView];
    
    [self setUpDismissButton];
   
}
    
// MARK: SetUp
    
-(void)setUpDefaultProperty {
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview: self.tableView];

    _bottonView = [[[NSBundle mainBundle] loadNibNamed:@"CheckoutBottonView" owner:self options:nil] lastObject];
    
    [self.view addSubview: self.bottonView];

}

-(void)setUpDismissButton {
    
    UIImage *btnImage = [UIImage imageNamed:@"icon-cross"];
    
    UIBarButtonItem *dismissButton = [[UIBarButtonItem alloc] initWithImage: btnImage style: UIBarButtonItemStylePlain target: self action:@selector(dismissViewController)];
    
    self.navigationItem.leftBarButtonItem = dismissButton;
    
}

- (void)setUpBottonViewLayout{
    
    self.bottonView.translatesAutoresizingMaskIntoConstraints = NO;
    /* Leading space to superview */
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.bottonView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute: NSLayoutAttributeLeft
                                          multiplier:1.0
                                          constant:0];
    /* Top space to superview Y*/
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint
                                           constraintWithItem:self.bottonView
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute: NSLayoutAttributeRight
                                           multiplier:1.0
                                           constant:0];
    /* Fixed width */
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.bottonView
                                            attribute:NSLayoutAttributeBottom
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.view
                                            attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                            constant:0];
    /* Fixed Height */
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.bottonView
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:nil
                                            attribute:NSLayoutAttributeNotAnAttribute
                                            multiplier:1.0
                                            constant:80];
    
    /* 4. Add the constraints to button's superview*/
    [self.view addConstraints:@[leftConstraint, rightConstraint, bottonConstraint, heightConstraint]];
    
}
    
- (void)setUpTableView {
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    /* Leading space to superview */
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.tableView
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.view
                                          attribute: NSLayoutAttributeLeft
                                          multiplier:1.0
                                          constant:0];
    /* Top space to superview Y*/
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint
                                           constraintWithItem:self.tableView
                                           attribute:NSLayoutAttributeRight
                                           relatedBy:NSLayoutRelationEqual
                                           toItem:self.view
                                           attribute: NSLayoutAttributeRight
                                           multiplier:1.0
                                           constant:0];
    /* Fixed width */
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.tableView
                                            attribute:NSLayoutAttributeBottom
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.bottonView
                                            attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                            constant:0];
    /* Fixed Height */
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.tableView
                                            attribute:NSLayoutAttributeTop
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.view
                                            attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                            constant:0];
    
    /* 4. Add the constraints to button's superview*/
    [self.view addConstraints:@[leftConstraint, rightConstraint, bottonConstraint, topConstraint]];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UINib *checkoutItemNib = [UINib nibWithNibName: CHECKOUTITEM_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib: checkoutItemNib forCellReuseIdentifier: CHECKOUTITEM_TABLEVIEW_CELL];
    
    UINib *checkoutNib = [UINib nibWithNibName: CHECKOUT_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:checkoutNib forCellReuseIdentifier:CHECKOUT_TABLEVIEW_CELL];

}
    
    
- (void)dismissViewController {
    
    [self dismissViewControllerAnimated:YES completion: nil];

}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
    
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0){
        
        return 108.0;
        
    } else {
        
        return 633.0;
        
    }
    
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
    
        CheckoutItemTableViewCell *cell = (CheckoutItemTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"CheckoutItemTableViewCell" forIndexPath:indexPath];
        
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
        
        cell.productTitleLabel.text =  self.product.title;
        
        cell.productPriceLabel.text = [NSString stringWithFormat: @"$%zd", self.product.price];
        
        cell.quantityLabel.text = @"1";
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        return cell;
        
    } else {
        
        CheckoutTableViewCell *cell = (CheckoutTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"CheckoutTableViewCell" forIndexPath:indexPath];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    
    
    }
    
}


@end
