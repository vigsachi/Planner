//
//  CustomFontIstok.m
//  Planner
//
//  Created by Vig Sachidananda on 11/17/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "CustomFontIstok.h"

@implementation CustomFontIstok

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.font = [UIFont fontWithName:@"Istok Web Regular"
                                size:self.font.pointSize];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
