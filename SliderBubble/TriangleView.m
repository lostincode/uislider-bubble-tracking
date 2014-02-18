//
//  TriangleView.m
//  SliderBubble
//
//  Created by Bill Richards on 2/18/14.
//  Copyright (c) 2014 Bill Richards. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

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

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextBeginPath(ctx);
    CGContextMoveToPoint   (ctx, CGRectGetMinX(rect), CGRectGetMinY(rect));  // bottom left
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMinY(rect));  // mid top
    CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMaxY(rect));  // bottom right
    CGContextClosePath(ctx);
    
    CGContextSetRGBFillColor(ctx, 170.0f/255.0f, 170.0f/255.0f, 170.0f/255.0f, 1);
    CGContextFillPath(ctx);
}

@end
