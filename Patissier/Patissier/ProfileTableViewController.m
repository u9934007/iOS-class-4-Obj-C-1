//
//  ProfileTableTableViewController.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "Constants.h"

@interface ProfileTableViewController ()

@property ProfileComponent component;

@end

@implementation ProfileTableViewController

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
    
    NSInteger count = enumCount;

    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSLog(@"%ld", (long)section);
    
    switch (section) {
            
        case information:
        case segmentedControl:
            
            return 1;
            
        case content:
            
            return 1;
        
        default:
            
            return 0;
    }
    
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44.0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat aspectRatio;
    
    CGFloat width;
    
    CGFloat height;

    switch (indexPath.section) {

        case information:
            
            aspectRatio = 375.0 / 200.0;
            
            width = self.tableView.bounds.size.width;
            
            height = width / aspectRatio;
            
            return height;
            
        case segmentedControl:
            
            return UITableViewAutomaticDimension;
            
        default:
            break;
    }
    
    
    return 0;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    ProfileSegmentedControlTableViewCell *profileSegmentedControlTableViewCell = [[ProfileSegmentedControlTableViewCell alloc] init];
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (indexPath.section == information) {

        ProfileInformationTableViewCell *profileInformationTableViewCell = (ProfileInformationTableViewCell *) [tableView dequeueReusableCellWithIdentifier:PROFILE_INFORMATION_TABLEVIEW_CELL forIndexPath:indexPath];
        
        profileInformationTableViewCell.backgroundColor = [UIColor redColor];
        
        profileInformationTableViewCell.nameLabel.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];

        dispatch_async(dispatch_get_global_queue(0,0), ^{

            NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [[NSUserDefaults standardUserDefaults] objectForKey:@"picture"]]];

            if ( data != nil )
            {
                dispatch_async(dispatch_get_main_queue(), ^{

                    profileInformationTableViewCell.pictureImageView.image = [UIImage imageWithData: data];
                });
                
            }
        });
        
        profileInformationTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return profileInformationTableViewCell;
        
    }   else if (indexPath.section == segmentedControl) {
        
        ProfileSegmentedControlTableViewCell *profileSegmentedControlTableViewCell = (ProfileSegmentedControlTableViewCell *) [tableView dequeueReusableCellWithIdentifier:PROFILE_SEGMENTEDCONTROL_TABLEVIEW_CELL forIndexPath:indexPath];
        
        profileSegmentedControlTableViewCell.leftTitle = NSLocalizedString(@"Favorite", "");
        
        profileSegmentedControlTableViewCell.rightTitle = NSLocalizedString(@"Purchased", "");
        
        profileSegmentedControlTableViewCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return profileSegmentedControlTableViewCell;
        
    } else {
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    
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
