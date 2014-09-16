//
//  SlidingBlockLayer.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "SlidingBlockLayer.h"

@implementation SlidingBlockLayer

@synthesize yearValue;

-(void) drawInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    CGContextSetRGBStrokeColor(ctx, 254, 0, 0, 1);
    
    CGContextSetLineWidth(ctx, 2.0);
    CGContextMoveToPoint(ctx, 0.0, 0);
    CGContextAddLineToPoint(ctx, 1124, 0);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1124.0, 0);
    CGContextAddLineToPoint(ctx, 1134, 5);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1134.0, 5);
    CGContextAddLineToPoint(ctx, 1144, 0);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1144.0, 0);
    CGContextAddLineToPoint(ctx, 2124, 0);
    CGContextStrokePath(ctx);
    
    CGContextSetLineWidth(ctx, 3.0);
    
    CGContextMoveToPoint(ctx, 0.0, 5);
    CGContextAddLineToPoint(ctx, 1124, 5);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1124.0, 5);
    CGContextAddLineToPoint(ctx, 1134, 10);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1134.0, 10);
    CGContextAddLineToPoint(ctx, 1144, 5);
    CGContextStrokePath(ctx);
    
    CGContextMoveToPoint(ctx, 1144.0, 5);
    CGContextAddLineToPoint(ctx, 2124, 5);
    CGContextStrokePath(ctx);
    
    CGContextSetLineWidth(ctx, 2.0);
   
    CGContextMoveToPoint(ctx, 1134.0, 10.0);
    CGContextAddLineToPoint(ctx, 1134.0, 249);
    CGContextStrokePath(ctx);

    //CGContextAddEllipseInRect(ctx, CGRectMake( 0.0, 150, 60.0, 60.0));
    CGContextSetRGBFillColor(ctx, 254.0, 0.0, 0.0, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake( 1104.0, 150, 60.0, 60.0));
    CGContextFillEllipseInRect(ctx, CGRectMake( 1128.0, 242.0, 12.0, 12.0));
    
    UIGraphicsPushContext(ctx);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont *font = [UIFont fontWithName:@"Courier" size:23];
    UIColor *textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [[@"" stringByAppendingFormat:@"%d",yearValue] drawInRect:CGRectMake(1104.0,165.0, 60.0, 40.0) withAttributes:dict];
    UIGraphicsPopContext();
    CGContextRestoreGState(ctx);
    /*
    timeTextLayer = [CATextLayer layer];
    [timeTextLayer setNeedsDisplayInRect: CGRectMake(0.0,0.0, 60.0, 40.0)];
    timeTextLayer.string = [@"" stringByAppendingFormat:@"%d",yearValue];
    timeTextLayer.position = CGPointMake(0.0, 0.0);
    timeTextLayer.anchorPoint = CGPointMake(0.5, 0.5);
    timeTextLayer.bounds = CGRectMake(0, 0, 60, 30);
    timeTextLayer.frame = CGRectMake(1104.0,165.0, 60.0, 40.0);
    timeTextLayer.fontSize = 23;
    timeTextLayer.alignmentMode = kCAAlignmentCenter;
    [self addSublayer:timeTextLayer];
   */
}

@end
