//
//  CalculatorBrain.h
//  calculator
//
//  Created by Louis Leboa on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property BOOL degree;
@property BOOL decimal;

-(void)pushOpperand: (double)operand;
-(double)preformOperation: (NSString *) operation;


@property (readonly) id program;


-(double) runProgram: (id)program;


 
+(NSString *)descriptionOfProgram: (id)program;

@end
