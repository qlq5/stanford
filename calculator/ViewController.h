//
//  ViewController.h
//  calculator
//
//  Created by Louis Leboa on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	IBOutlet UISegmentedControl *segment;

}

-(IBAction)changeSeg;

@property (weak, nonatomic) IBOutlet UILabel *display;


@end