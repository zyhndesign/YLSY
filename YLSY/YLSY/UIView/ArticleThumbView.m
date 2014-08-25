//
//  ArticleThumbView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ArticleThumbView.h"

@implementation ArticleThumbView

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
    UIImage *image = [UIImage imageNamed:@"pic1"];
    CGImageRef imageCG = [image CGImage];
    [image drawAtPoint:CGPointZero];
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(con, 3.0);
    CGContextSetRGBStrokeColor(con, 254, 0, 0, 1);
    CGContextMoveToPoint(con, 0.0, CGImageGetHeight(imageCG) + 10);
    CGContextAddLineToPoint(con, CGImageGetWidth(imageCG), CGImageGetHeight(imageCG) + 10);
    CGContextStrokePath(con);
    
    [@"北宋开宝九年（976），潭州太守朱洞在僧人办学的基础上，正式创立岳麓书院。嗣后，历经宋、元、明、清各代，至清末光绪二十九年（1903）改为湖南高等学堂，尔后相继改为湖南高等师范学校、湖南工业专门学校，1926年正式定名为湖南大学。历经千年，弦歌不绝，故世称“千年学府”，现与中南大学、湖南师范大学相邻，文化气息浓郁，并作为湖南大学下属的办学机构面向全球招生。" drawInRect:CGRectMake(0,CGImageGetHeight(imageCG) + 25,CGImageGetWidth(imageCG),CGImageGetHeight(imageCG)) withAttributes:nil];
    
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
