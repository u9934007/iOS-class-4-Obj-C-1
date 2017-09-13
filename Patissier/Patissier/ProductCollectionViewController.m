//
//  ProductCollectionViewController.m
//  Patissier
//
//  Created by 戴其安 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProductCollectionViewController.h"
#import "ProductCollectionViewCell.h"
#import "ProductManager.h"
@interface ProductCollectionViewController ()

@property NSMutableArray<ProductModel*> * productArray;

@property ProductManager* productManager;

@end

@implementation ProductCollectionViewController

static NSString * const reuseIdentifier = @"cell";

- (void)viewWillAppear:(BOOL)animated{
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor redColor];
    
    
    
    
    [self.collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.productManager = [ProductManager sharedInstance];
    self.productArray = [[NSMutableArray alloc] init];
    [self.productManager getProducts:^(NSMutableArray<ProductModel *> * _Nullable productArray, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"got you");
            
            
        }
        
        [self.productArray addObjectsFromArray: productArray];
        
        NSLog(@"%@", productArray);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            NSLog(@"Before reload data.");
            
            [self.collectionView reloadData];
            
            NSLog(@"After reload data.");
            
        });

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSLog(@"number of cell %d",self.productArray.count);
    
    
    //#warning Incomplete implementation, return the number of items
    
        return self.productArray.count;
//   return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForItemAtIndexPath");
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.productNameLabel.text = self.productArray[indexPath.row].title;
    cell.productPriceLabel.text = [NSString stringWithFormat:@"$%@",self.productArray[indexPath.row].price];
    //    cell.productNameLabel.text = @"hi";
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

@end
