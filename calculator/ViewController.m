//
//  ViewController.m
//  calculator
//
//  Created by Louis Leboa on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
@interface ViewController()
@property (nonatomic) BOOL userInMiddleOfEnteringNumber;

@property (nonatomic, strong) CalculatorBrain *brain;
@end
@implementation ViewController
@synthesize operations =_operations;
@synthesize display =_display;
@synthesize history = _history;
@synthesize userInMiddleOfEnteringNumber=_userInMiddleOfEnteringNumber;

@synthesize brain=_brain;

-(CalculatorBrain *)brain{
    if(!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}



- (IBAction)digitPressed:(UIButton *)sender{
    NSString *digit = sender.currentTitle;
    if ([@"." isEqualToString:digit]) {
        if (self.brain.decimal == YES){
            return;}
        else if( self.brain.decimal == NO){
            _brain.decimal = YES;
            self.display.text = [self.display.text stringByAppendingString:digit];
            self.history.text = [self.history.text stringByAppendingString:digit];

            return;
        }}
    if (self.userInMiddleOfEnteringNumber) {
        self.display.text = [self.display.text stringByAppendingString:digit];
        self.history.text = [self.history.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.history.text = [self.history.text stringByAppendingString:digit];
        self.userInMiddleOfEnteringNumber = YES;
    }
}




-(IBAction)changeSeg{
	if(segment.selectedSegmentIndex == 0){
        _brain.degree = NO;
	}
	if(segment.selectedSegmentIndex == 1){
        _brain.degree = YES;
        
	}
}


- (IBAction)enterPressed {
    [self.brain pushOpperand:[self.display.text doubleValue]];
    self.userInMiddleOfEnteringNumber = NO;
    double result = [self.brain preformOperation: self.operations];
    self.display.text = [NSString stringWithFormat:@"%g", result];


    
}

- (IBAction)OperationPressed:(id)sender {
    if (self.userInMiddleOfEnteringNumber){
        [self.brain pushOpperand:[self.display.text doubleValue]];
         self.userInMiddleOfEnteringNumber = NO;
    }
    self.operations = [sender currentTitle];
    self.history.text = [self.history.text stringByAppendingString:self.operations];
    if ([self.operations isEqualToString:@"c"]) {
        self.history.text = @"";
    }
}



- (void)viewDidUnload {
    [self setHistory:nil];
    [super viewDidUnload];
}
@end