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
#import "ProductCommentViewController.h"
@interface ProductCollectionViewController ()

@property NSMutableArray<ProductModel*> * productArray;

@property NSMutableArray<UIImage*> * productImageArray;
@property NSMutableDictionary *productImageDictionary;
@property ProductManager* productManager;

@end



@implementation ProductCollectionViewController

//-(int)a {
//    return self.a+5;
//}
//-(void)setA:(int)a{
//    self.a = a;
//    
//}



static NSString * const reuseIdentifier = @"cell";

- (void)viewWillAppear:(BOOL)animated{
    
    
}


- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor redColor];
    self.productImageArray = [[NSMutableArray alloc]init];
    self.productImageDictionary = [[NSMutableDictionary alloc]init];
    
    
    
    
    [self.collectionView registerClass:[ProductCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.productManager = [ProductManager sharedInstance];
    self.productArray = [[NSMutableArray alloc] init];
    [self.productManager getProducts:^(NSMutableArray<ProductModel *> * _Nullable productArray, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"got you");
            
            
        }
        
        [self.productArray addObjectsFromArray: productArray];
        
        NSLog(@"%@", productArray);
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            for (int i=0;i<self.productArray.count;i++) {
                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.productArray[i].imageURLString]];
                if ( data != nil )
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        // WARNING: is the cell still using the same data by this point??
                        [self.productImageDictionary setValue:[UIImage imageWithData: data] forKey: self.productArray[i].iD];
                        [self.productImageArray addObject:[UIImage imageWithData: data]];
                        [self.collectionView reloadData];
                        
//                        [[NSString alloc] initWithFormat: @"%@", _product.title]
//                        
                    });
                    
                }
            
            }
            
        });

        
        
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            [self.collectionView reloadData];
            
            
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
-(void)heartButtonTapped:(NSObject *)sender {
    NSLog(@"%@",sender);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForItemAtIndexPath");
    
    ProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.productNameLabel.text = self.productArray[indexPath.row].title;
    cell.productPriceLabel.text = [NSString stringWithFormat:@"$%@",self.productArray[indexPath.row].price];
    [cell.productHeartButton addTarget:self action:@selector(heartButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    if (indexPath.row<self.productImageDictionary.count){
        cell.productImageView.image = [self.productImageDictionary objectForKey:self.productArray[indexPath.row].iD];
    }
    
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
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ProductCommentViewController *productCommentViewController = [[ProductCommentViewController alloc]initWithProduct:self.productArray[indexPath.row]];

    [self.navigationController showViewController:productCommentViewController sender:self];

}

@end
