//
//  customXib.h
//  digitalClock
//
//  Created by swetha on 4/9/18.
//  Copyright © 2018 big nerd ranch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customXib : UIView
@property (weak, nonatomic) IBOutlet UIView *middleBar;
@property (weak, nonatomic) IBOutlet UIView *topbar;
@property (weak, nonatomic) IBOutlet UIView *topLeftBar;
@property (weak, nonatomic) IBOutlet UIView *topRightBar;
@property (weak, nonatomic) IBOutlet UIView *bottomLeftBar;
@property (weak, nonatomic) IBOutlet UIView *bottomRightBar;
@property (weak, nonatomic) IBOutlet UIView *bottomBar;

-(void)changeTheNumber: (int)number;
//-(void)startCount:(NSTimer *)timer;

-(void)changeColor:(UIColor*)color;

@end
