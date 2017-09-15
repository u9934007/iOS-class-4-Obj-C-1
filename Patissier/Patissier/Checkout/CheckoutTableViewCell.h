//
//  CheckoutTableViewCell.h
//  Patissier
//
//  Created by 楊采庭 on 2017/9/13.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckoutTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
    
@property (weak, nonatomic) IBOutlet UITextField *postalCodeTextField;
    
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
    
@property (weak, nonatomic) IBOutlet UIButton *sameAsBuyerButton;
    
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
    
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
    
@property (weak, nonatomic) IBOutlet UITextField *cardNumberTextField;
  
@property (weak, nonatomic) IBOutlet UITextField *expMonthTextField;

@property (weak, nonatomic) IBOutlet UITextField *expYearTextField;
    
@property (weak, nonatomic) IBOutlet UITextField *codeTextField;

@end
