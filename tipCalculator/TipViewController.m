//
//  ViewController.m
//  tipCalculator
//
//  Created by Abhinav Wagle on 1/13/17.
//  Copyright (c) 2017 Abhinav. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UITextField *tipLabel;
@property (weak, nonatomic) IBOutlet UITextField *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}


- (IBAction)onValueChange:(UISegmentedControl *)sender {
    [self updateValues];
}

- (void)updateValues {
    // Get bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    // Compute tip and total
    NSArray *tipValues = @[@0.15f, @0.2f, @0.25f];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
                                                
    // update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"defaultKey"];
    self.tipControl.selectedSegmentIndex = intValue;
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

@end
