//
//  PlannerTextField.m
//  Planner
//
//  Created by Vig Sachidananda on 9/18/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "PlannerTextField.h"

@implementation PlannerTextField



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (BOOL)resignFirstResponder

{
    
    if ([self.inputView respondsToSelector:@selector(date)])
    {
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"h:mm a"];
        self.text = [outputFormatter stringFromDate:[((UIDatePicker *)self.inputView) date]];
    }
    return [super resignFirstResponder];
}
@end