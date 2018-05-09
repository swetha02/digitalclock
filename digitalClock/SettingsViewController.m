//
//  SettingsViewController.m
//  digitalClock
//
//  Created by swetha on 4/20/18.
//  Copyright © 2018 big nerd ranch. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController (){
    NSUserDefaults *defaults;
    NSArray *_pickerData;
}
@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation SettingsViewController

@synthesize buttonOne;
@synthesize buttonTwo;
@synthesize buttonThree;
@synthesize buttonFour;
@synthesize buttonFive;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    buttonOne.layer.backgroundColor = [UIColor redColor].CGColor;
    buttonTwo.layer.backgroundColor = [UIColor greenColor].CGColor;
    buttonThree.layer.backgroundColor = [UIColor orangeColor].CGColor;
    buttonFour.layer.backgroundColor = [UIColor yellowColor].CGColor;
    buttonFive.layer.backgroundColor = [UIColor purpleColor].CGColor;
    
    defaults = [NSUserDefaults standardUserDefaults];
    BOOL state =  [defaults boolForKey:@"toggleButton"];
    self.toogleButton.on = state;
    
    
    
    
    _pickerData = @[@"pacifi Time Zone",@"eastern Time Zone",@"mountain Time Zone",@"central Time Zone"];
   // self.picker.dataSource = self;
    self.picker.delegate = self;

    [_picker selectRow:[defaults integerForKey:@"Index"] inComponent:0 animated:NO];
    
    
    [self highlightColor];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [[self navigationController] setNavigationBarHidden:NO animated:YES];
    
    double bw =  buttonOne.frame.size.width;
    double bw2 =  buttonTwo.frame.size.width;
    double bw3 =  buttonOne.frame.size.width;
    double bw4 =  buttonOne.frame.size.width;
    double bw5 =  buttonOne.frame.size.width;
    
    
    buttonOne.layer.borderWidth = 4;
    buttonTwo.layer.borderWidth=4;
    buttonThree.layer.borderWidth = 4;
    buttonFour.layer.borderWidth =4;
    buttonFive.layer.borderWidth=4;
    
    buttonOne.layer.cornerRadius = bw/2;
    buttonTwo.layer.cornerRadius = bw2/2;
    buttonThree.layer.cornerRadius = bw3/2;
    buttonFour.layer.cornerRadius = bw4/2;
    buttonFive.layer.cornerRadius = bw5/2;
    
   //
    
}

-(void) highlightColor {
    
    buttonOne.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonTwo.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonThree.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonFour.layer.borderColor = [UIColor whiteColor].CGColor;
    buttonFive.layer.borderColor = [UIColor whiteColor].CGColor;
    
    if ([[defaults objectForKey:@"color"] isEqualToString:@"redColor"]) {
        buttonOne.layer.borderColor = [UIColor blackColor].CGColor;
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"greenColor"]){
        buttonTwo.layer.borderColor = [UIColor blackColor].CGColor;
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"orangeColor"]){
        buttonThree.layer.borderColor = [UIColor blackColor].CGColor;
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"yellowColor"]){
        buttonFour.layer.borderColor = [UIColor blackColor].CGColor;
    }
    else if ([[defaults objectForKey:@"color"]isEqualToString:@"purpleColor"]){
        buttonFive.layer.borderColor = [UIColor blackColor].CGColor;
    }

}

- (IBAction)purple:(id)sender {
    [defaults setObject:@"purpleColor" forKey: @"color"];
    [self highlightColor];
}
- (IBAction)yellow:(id)sender {
    [defaults setObject:@"yellowColor" forKey:@"color"];
    [self highlightColor];
}


- (IBAction)orange:(id)sender {
    [defaults setObject:@"orangeColor" forKey:@"color"];
    [self highlightColor];

}
- (IBAction)green:(id)sender {
    [defaults setObject:@"greenColor" forKey:@"color"];
    [self highlightColor];

}

- (IBAction)red:(id)sender {
    [defaults setObject:@"redColor" forKey:@"color"];
    [self highlightColor];

}

- (IBAction)toggle:(id)sender
 {
    
     BOOL state =  self.toogleButton.on;
     
     NSLog(@"toggle button is %d", state);
     
     NSLog(state ? @"Yes" : @"No");

     [defaults setBool:state forKey:@"toggleButton"];
     
     
}

-(long)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(long)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return _pickerData.count;
 }

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return _pickerData[row];
    
}



-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *str = [_pickerData objectAtIndex:row];
    NSLog(@"%@",str);
    [defaults setInteger:row forKey:@"Index"];
    
    
}



    
    
    




    






@end
