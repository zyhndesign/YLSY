//
//  HistoryScrollView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HistoryScrollView.h"

@implementation HistoryScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(con, 3.0);
    CGContextSetRGBStrokeColor(con, 254, 0, 0, 1);
    CGContextMoveToPoint(con, 0.0, 100);
    CGContextAddLineToPoint(con, 1024, 100);
    CGContextStrokePath(con);
    
    CGContextSetLineWidth(con, 1.0);
    CGContextMoveToPoint(con, 0.0, 106);
    CGContextAddLineToPoint(con, 1024, 106);
    CGContextStrokePath(con);
        
    CGContextSetLineWidth(con, 2.0);
    CGContextMoveToPoint(con, 80.0, 650);
    CGContextAddLineToPoint(con, 944, 650);
    CGContextStrokePath(con);
    
    CGContextSetLineWidth(con, 2.0);
    CGContextMoveToPoint(con, 80.0, 645);
    CGContextAddLineToPoint(con, 80.0, 655);
    CGContextStrokePath(con);
    
    CGContextSetLineWidth(con, 2.0);
    CGContextMoveToPoint(con, 944.0, 645);
    CGContextAddLineToPoint(con, 944.0, 655);
    CGContextStrokePath(con);
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
