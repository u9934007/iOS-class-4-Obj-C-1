//
//  ProfileTableTableViewController.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProfileTableTableViewController.h"
#import "Constants.h"

@interface ProfileTableTableViewController ()

typedef NS_ENUM(NSInteger, Component){
    
    information,
    
    segmentedControl,
    
    content,
    
    enumCount
    
};

@ property Component component;

@end

@implementation ProfileTableTableViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    
}

- (void) setUpTableView {
    
    UINib *nib1 = [UINib nibWithNibName: PROFILE_INFORMATION_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:nib1 forCellReuseIdentifier: PROFILE_INFORMATION_TABLEVIEW_CELL];
    
    UINib *nib2 = [UINib nibWithNibName: PROFILE_SEGMENTEDCONTROL_TABLEVIEW_CELL bundle:nil];
    
    [self.tableView registerNib:nib2 forCellReuseIdentifier: PROFILE_SEGMENTEDCONTROL_TABLEVIEW_CELL];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.backgroundColor = [UIColor colorWithRed: 250.0 / 255.0
                                                     green: 250.0 / 255.0
                                                      blue: 250.0 / 255.0
                                                     alpha: 1.0];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger num = enumCount;
    
    
    
    return enumCount;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (_component) {
            
        case information: segmentedControl:
            
            return 1;
            
        case content:
            
            return 0;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: PROFILE_SEGMENTEDCONTROL_TABLEVIEW_CELL forIndexPath:indexPath];
    
    UITableViewCell *test = [[UITableViewCell alloc] init];
    
    return test;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
