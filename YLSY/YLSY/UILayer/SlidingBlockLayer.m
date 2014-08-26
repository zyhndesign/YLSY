//
//  SlidingBlockLayer.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "SlidingBlockLayer.h"

@implementation SlidingBlockLayer

-(void) drawInContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetRGBStrokeColor(ctx, 254, 0, 0, 1);
    CGContextMoveToPoint(ctx, 30.0, 0.0);
    CGContextAddLineToPoint(ctx, 30.0, 240);
    CGContextStrokePath(ctx);

    //CGContextAddEllipseInRect(ctx, CGRectMake( 0.0, 150, 60.0, 60.0));
    CGContextSetRGBFillColor(ctx, 254.0, 0.0, 0.0, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake( 0.0, 150, 60.0, 60.0));
    CGContextFillEllipseInRect(ctx, CGRectMake( 24.0, 232.0, 12.0, 12.0));
    
    timeTextLayer = [CATextLayer layer];
    timeTextLayer.string = @"1275";
    
}

@end
