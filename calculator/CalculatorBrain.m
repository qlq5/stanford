//
//  CalculatorBrain.m
//  calculator
//
//  Created by Louis Leboa on 7/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain

@synthesize programStack=_programStack;


-(NSMutableArray *)programStack{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}


-(void)pushOpperand: (double)operand {
    [self.programStack addObject: [NSNumber numberWithDouble:operand]];
}

-(double)preformOperation: (NSString *) operation
{
    
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}


-(id)program
{
    return [self.programStack copy];
}

+(NSString *)descriptionOfProgram:(id)program{
    return @"Implement this 2";
}  
+(double)popOperandOffStack: (NSMutableArray *) stack{
    double result = 0;
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        result =  [topOfStack doubleValue];
    }
    
    else if ([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        double b = [self popOperandOffStack:stack];
        double a = [self popOperandOffStack:stack];
        if([operation isEqualToString:@"+"]) {
            result = a + b;
        } else if ([@"*" isEqualToString:operation]) {
            result = a * b;
        }else if ([@"/" isEqualToString:operation]) {
            result = a / b;
        }else if ([@"-" isEqualToString:operation]) {
            result = a - b;
        }else if ([@"π" isEqualToString:operation]) {
            result = b * 3.14159265358979;
        }else if ([@"c" isEqualToString:operation]) {
            [stack removeAllObjects];
        }else if ([@"√"isEqualToString:operation]){
            result = sqrt(b);
        }else if ([@"sin"isEqualToString:operation]){
            result = sin(b)*(180/M_PI);
        }else if ([@"cos"isEqualToString:operation]){
            result = cos(b);
        }else if ([@"√"isEqualToString:operation]){
            result = tan(b);
        }

            
     }
    
    return result;
}
                              
+ (double)runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy]; 
    }
    return [self popOperandOffStack:stack];  
}


@end
