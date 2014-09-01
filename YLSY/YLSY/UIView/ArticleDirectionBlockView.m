//
//  ArticleDirectionBlockView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-29.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ArticleDirectionBlockView.h"

@implementation ArticleDirectionBlockView

@synthesize articleNumber, lineHeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetRGBStrokeColor(ctx, 254, 0, 0, 1);
    
    CGContextMoveToPoint(ctx, 30.0, 15.0);
    CGContextAddLineToPoint(ctx, 30.0, 60 + lineHeight);
    CGContextStrokePath(ctx);
    
    //CGContextAddEllipseInRect(ctx, CGRectMake( 0.0, 150, 60.0, 60.0));
    CGContextSetRGBFillColor(ctx, 254.0, 0.0, 0.0, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake( 15.0, 0, 30.0, 30.0));
    CGContextFillEllipseInRect(ctx, CGRectMake( 24.0, 48 + lineHeight, 12.0, 12.0));
    
    numLayer = [CATextLayer layer];
    numLayer.string = [[NSNumber numberWithInt:articleNumber] stringValue];
    numLayer.position = CGPointMake(0.0, 0.0);
    numLayer.anchorPoint = CGPointMake(0.5, 0.5);
    numLayer.bounds = CGRectMake(0, 0, 60, 30);
    numLayer.frame = CGRectMake(0.0,0.0, 60.0, 60.0);
    numLayer.fontSize = 23;
    numLayer.alignmentMode = kCAAlignmentCenter;
    [self.layer addSublayer:numLayer];

}


@end
