//
//  ProfileSegmentedControlTableViewCell.m
//  Patissier
//
//  Created by Brady Huang on 2017/9/14.
//  Copyright © 2017年 Brady Huang. All rights reserved.
//

#import "ProfileSegmentedControlTableViewCell.h"

@protocol ProfileSegmentedControlTableViewCellDelegate <NSObject>

@optional

-(void) cell:(ProfileSegmentedControlTableViewCell*)cell didSelect:(Segment)segment;

@end

@interface ProfileSegmentedControlTableViewCell ()

@end

@implementation ProfileSegmentedControlTableViewCell

- (void) setSelectedSegment:(Segment)selectedSegment {
    
    UIButton *leftButton = _leftButton;
    
    UIButton *rightButton = _rightButton;
    
    switch (selectedSegment) {

        case left:
            
            leftButton.backgroundColor = [UIColor blackColor];
            
            leftButton.alpha = 0.2;
            
            rightButton.backgroundColor = [UIColor clearColor];
            
        case right:

            rightButton.backgroundColor = [UIColor blackColor];
            
            rightButton.alpha = 0.2;
            
            leftButton.backgroundColor = [UIColor clearColor];
            
    }
    
}

- (void) setRightTitle:(NSString *)rightTitle {
    
    UIButton *button = _rightButton;
    
    [button setTitle:rightTitle forState:UIControlStateNormal];
    
}

- (void) setLeftTitle:(NSString *)leftTitle {
    
    UIButton *button = _leftButton;
    
    [button setTitle:leftTitle forState:UIControlStateNormal];
    
}

- (void)awakeFromNib {

    [super awakeFromNib];

    [self setUpBackgroundView];
    
    [self setUpLeftButton];
    
    [self setUpRightButton];
    
    self.selectedSegment = left;
    
}


- (void)setUpBackgroundView {
    
    UIView *view = [self contentView];
    
    view.backgroundColor = [UIColor colorWithRed: 255.0 / 255.0
                                           green: 94.0  / 255.0
                                            blue: 89.0 / 255.0
                                           alpha: 1.0];
}

- (void)setUpLeftButton {
    
    UIButton *button = _leftButton;
    
    [button addTarget:self
               action:@selector(leftDidSelect:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:self.leftTitle
            forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor blackColor];
    
    button.alpha = 0.2;
    
    button.layer.cornerRadius = 4.0;
    
    button.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    
}

- (void)setUpRightButton {
    
    UIButton *button = _rightButton;
    
    [button addTarget:self
               action:@selector(rightDidSelect:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:self.rightTitle
            forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor blackColor];
    
    button.alpha = 0.2;
    
    button.layer.cornerRadius = 4.0;
    
    button.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    
}

- (void)leftDidSelect:(id) sender {
    
    self.selectedSegment = left;
    
}

- (void)rightDidSelect:(id) sender {
    
    self.selectedSegment = right;
    
}


@end
