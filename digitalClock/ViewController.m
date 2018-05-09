//
//  ViewController.m
//  digitalClock
//
//  Created by swetha on 4/9/18.
//  Copyright © 2018 big nerd ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer* timer;
    NSUserDefaults* defaults;
}

@property(nonatomic) int i;
@property (weak, nonatomic) IBOutlet customXib *digitView;
@property (weak, nonatomic) IBOutlet customXib *digitView1;
@property (weak, nonatomic) IBOutlet customXib *digitView2;
@property (weak, nonatomic) IBOutlet customXib *digitView3;
@property (weak, nonatomic) IBOutlet UIView *secondsView;

@property (weak, nonatomic) IBOutlet UIView *secondsView1;

@property (weak, nonatomic) IBOutlet UIView *blinkBtnOne;
@property (weak, nonatomic) IBOutlet UIView *blinkBtnTwo;


@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *blinkView;

@property (weak, nonatomic) IBOutlet UIView *digit4;

@property (weak, nonatomic) IBOutlet customXib *digitView4;
@property (weak, nonatomic) IBOutlet customXib *digitView5;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewClick;
@property NSArray *imageArray;

@end
@implementation ViewController
@synthesize blinkBtnOne;
@synthesize blinkBtnTwo;

//int counter = 0;

- (void)viewDidLoad {
    [super viewDidLoad];

//    [_digitView changeTheNumber:counter];
//    [_digitView1 changeTheNumber:counter];
//    [_digitView2 changeTheNumber:counter];
//    [_digitView3 changeTheNumber:counter];
//

    timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(startCount) userInfo:nil repeats:YES];
    
    
    
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self imgScroll];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
[[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    


    defaults = [NSUserDefaults standardUserDefaults];
    
    UIColor *selectedColor = [UIColor whiteColor];
    
    if ([[defaults objectForKey:@"color"] isEqualToString:@"purpleColor"]) {
        
        selectedColor = [UIColor purpleColor];
        
        
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"redColor"]){
        
        
        selectedColor = [UIColor redColor];
        
 
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"greenColor"]){
        
        selectedColor = [UIColor greenColor];
        
 
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"orangeColor"]){
        
        selectedColor = [UIColor orangeColor];
        
  
    }
    
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"yellowColor"]){
        
        selectedColor = [UIColor yellowColor];
        
   
    }
    
    [_digitView changeColor: selectedColor];
    [_digitView1 changeColor: selectedColor];
    [_digitView2 changeColor: selectedColor];
    [_digitView3 changeColor: selectedColor];
    [_digitView4 changeColor:selectedColor];
    [_digitView5 changeColor:selectedColor];
    
    blinkBtnTwo.layer.backgroundColor = selectedColor.CGColor;
    blinkBtnOne.backgroundColor = selectedColor;
    
    
    double bw =  blinkBtnOne.frame.size.width;
    double bw1 =  blinkBtnTwo.frame.size.width;
    blinkBtnOne.layer.borderWidth = 1;
    blinkBtnTwo.layer.borderWidth = 1;
    blinkBtnOne.layer.cornerRadius = bw/2;
    blinkBtnTwo.layer.cornerRadius = bw1/2;

    
    
   
    
    
    
}

- (IBAction)buttonClick:(id)sender {
//    counter++;


//    if (counter < 10) {
//        [_digitView changeTheNumber:counter];
//        [_digitView1 changeTheNumber:counter];
//        [_digitView2 changeTheNumber:counter];
//        [_digitView3 changeTheNumber:counter];
//    } else if (counter == 10) {
//        counter = 0;
//        [_digitView changeTheNumber:counter];
//        [_digitView1 changeTheNumber:counter];
//        [_digitView2 changeTheNumber:counter];
//        [_digitView3 changeTheNumber:counter];
//    }
//    NSLog(@"counter %d",counter);
    
}

- (IBAction)settingsClicked:(id)sender {
}



-(void)startCount{
    NSDate *dateObj = [[NSDate alloc]init];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateStyle:NSDateFormatterShortStyle];
    NSString * stringObj = [dateFormatter stringFromDate:dateObj];
   // NSLog(@"todays date %@",stringObj);

    NSArray *zones = @[@"PDT",@"EDT",@"MDT",@"CDT"];
    NSInteger row =  [defaults integerForKey:@"Index"];
    NSString *zoneValue = zones[row];

    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:zoneValue]];
//    dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    
    
    // to see on or off - from defaults - nsuserdefaults - key toggleButton
    BOOL state =  [defaults boolForKey:@"toggleButton"];
    
    if(state==YES){ // state YES means 24 hrs selected
        [dateFormatter setDateFormat:@"HH:mm:ss "];

    }
    else { // else means 12 hrs selected
        
        [dateFormatter setDateFormat:@"hh:mm:ss a"];

    }
  
    
    NSString *currentTime = [dateFormatter stringFromDate:dateObj];
   // NSLog(@"todays date %@",currentTime);
    
    
    NSArray *seperatedTimeAndAm = [currentTime componentsSeparatedByString:@" "];
    self.label.text = seperatedTimeAndAm[1];

    NSArray *components = [seperatedTimeAndAm[0] componentsSeparatedByString:@":"];

    const char *hours = [components[0] UTF8String];
    const char *minutes = [components[1] UTF8String];
    const char *seconds = [components [2] UTF8String];
    
    
    int h1 = (int)hours[0] - (int)'0';
    int h2 = (int)hours[1] - (int)'0';
    
    int m1 = (int)minutes[0] - (int)'0';
    int m2 = (int)minutes[1] - (int)'0';
    
    int s1 = (int)seconds[0] - (int)'0';
    int s2 = (int)seconds[1] - (int)'0';
    
    
    
    

    
    NSLog(@"my h1 %d h2 %d m1 %d m2 %d s1 %d s2 %d", h1, h2, m1, m2,s1,s2);
    
    [_digitView changeTheNumber:h1];
    [_digitView1 changeTheNumber:h2];
    [_digitView2 changeTheNumber:m1];
    [_digitView3 changeTheNumber:m2];
    [_digitView4 changeTheNumber:s1];
    [_digitView5 changeTheNumber:s2];
    
    [self blink];

    
}
//
//can either do it in this way to blink dots;
//-(void)blink{
//    blinkBtnOne.hidden = !blinkBtnOne.isHidden;
//    blinkBtnTwo.hidden=!blinkBtnTwo.isHidden;
//
//}

-(void)blink{
    BOOL isButtonHidden =  blinkBtnOne.isHidden;
        if(isButtonHidden==YES){
            blinkBtnOne.hidden = NO;
            
        }
        else {
           blinkBtnOne.hidden = YES;
        }
    if(isButtonHidden==NO){
        blinkBtnTwo.hidden=YES;
    }
    else{
        blinkBtnTwo.hidden = NO;
    }
    
}
    
-(void)imgScroll{
    
    
    int x=0;
    self.scrollViewClick.pagingEnabled=YES;
    NSArray *imageArray = [NSArray arrayWithObjects:@"1.jpg",@"2.jpg" ,@"3.jpg",@"4.jpg",@"5.jpg",nil];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    screenWidth = screenWidth;
    
    
    [self.scrollViewClick.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    for (int i=0; i<imageArray.count; i++)
    {
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(x, 0,screenWidth, self.scrollViewClick.frame.size.height)];
        img.image=[UIImage imageNamed:[imageArray objectAtIndex:i]];
        [self.scrollViewClick addSubview:img];
        x=x+screenWidth;
        
    }
    self.scrollViewClick.contentSize=CGSizeMake(x, self.scrollViewClick.frame.size.height);
    self.scrollViewClick.contentOffset=CGPointMake(0, 0);
}
    

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        NSLog(@"Lanscapse");
    }
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        NSLog(@"UIDeviceOrientationPortrait");
    }
    
}
        
        
        
        
        
        
        
        

    
    
    
    
    



    
    
    
    
    
    

    
    
    
    
    
    
    










@end
