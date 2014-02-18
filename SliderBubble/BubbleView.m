//
//  BubbleView.m
//  SliderBubble
//
//  Created by Bill Richards on 2/18/14.
//  Copyright (c) 2014 Bill Richards. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
}

- (void)drawRect:(CGRect)rect
{
    // Set the fill color
	[[UIColor lightGrayColor] setFill];
    
    // Create the path for the rounded rectanble
    CGRect roundedRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height);
    UIBezierPath *roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:roundedRect cornerRadius:6.0];
    
    [roundedRectPath fill];
}

@end
