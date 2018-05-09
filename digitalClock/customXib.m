//
//  customXib.m
//  digitalClock
//
//  Created by swetha on 4/9/18.
//  Copyright © 2018 big nerd ranch. All rights reserved.
//

#import "customXib.h"
@interface customXib()
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end
@implementation customXib

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self prepare];
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self prepare];
    }
    return self;
}
-(void)prepare{
    [[NSBundle mainBundle]loadNibNamed:@"customXib" owner:self options:nil];
    [self addSubview:_contentView];
    self.contentView.frame = self.bounds;
}





-(void)changeTheNumber: (int) number {
    if (number == 0){
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = NO;
        self.middleBar.hidden = YES;
        self.bottomLeftBar.hidden = NO;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = NO;
    }
    else if(number == 1){
        self.topbar.hidden = YES;
        self.topLeftBar.hidden = YES;
        self.middleBar.hidden = YES;
        self.bottomLeftBar.hidden = YES;
        self.bottomBar.hidden = YES;
        self.topRightBar.hidden = NO;
        self.bottomRightBar.hidden = NO;
    }
    else if (number==2){
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = YES;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = NO;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =YES;
        self.topRightBar.hidden = NO;
    }
    else if (number == 3){
        
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = YES;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = YES;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = NO;
        
    }
    else if(number == 4){
        self.topbar.hidden = YES;
        self.topLeftBar.hidden = NO;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = YES;
        self.bottomBar.hidden = YES;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = NO;
    }
    else if(number == 5){
        
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = NO;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = YES;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = YES;
        
    }
    else if(number == 6){
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = NO;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = NO;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = YES;
    }
    else if (number == 7){
        
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = YES;
        self.middleBar.hidden = YES;
        self.bottomLeftBar.hidden = YES;
        self.bottomBar.hidden = YES;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = NO;
        
    }
    else if (number == 8){
        
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = NO;
        self.middleBar.hidden = NO;
        self.bottomLeftBar.hidden = NO;
        self.bottomBar.hidden = NO;
        self.bottomRightBar.hidden =NO;
        self.topRightBar.hidden = NO;
        
    }
    else if (number == 9) {
        self.bottomLeftBar.hidden = YES;
        self.middleBar.hidden = NO;
        self.topbar.hidden = NO;
        self.topLeftBar.hidden = NO;
        self.topRightBar.hidden = NO;
        self.bottomRightBar.hidden = NO;
        self.bottomBar.hidden = YES;
        
    }
}

-(void)changeColor:(UIColor*)color {
    //TODO: MAKE FUNK TO CHANGE COLOR
//    [self.contentView  setBackgroundColor:[UIColor redColor]];
    [self.topbar setBackgroundColor: color];
    [self.bottomBar setBackgroundColor: color];
    [self.topLeftBar setBackgroundColor: color];
    [self.topRightBar setBackgroundColor: color];
    [self.bottomLeftBar setBackgroundColor: color];
    [self.bottomRightBar setBackgroundColor: color];
    [self.middleBar setBackgroundColor: color];
    
}


@end
