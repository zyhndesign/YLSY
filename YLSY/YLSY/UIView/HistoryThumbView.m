//
//  HistoryThumbView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HistoryThumbView.h"

@implementation HistoryThumbView

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
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    UIFont *font = [UIFont fontWithName:@"Courier" size:30];
    UIColor *textColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [@"公元1275年" drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 0, CGImageGetWidth(imageCG),40) withAttributes:dict];
    [@"元朝书院屡毁屡建" drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 50, CGImageGetWidth(imageCG),40) withAttributes:dict];
    
    UIFont *contentFont = [UIFont fontWithName:@"Courier" size:16];
    UIColor *contentTextColor = [UIColor colorWithRed:2 green:0 blue:0 alpha:1];
    NSDictionary *contentDict = [[NSDictionary alloc] initWithObjectsAndKeys:contentFont, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,contentTextColor, NSForegroundColorAttributeName, nil];
    [@"1275年元兵攻破长沙，岳麓书院被付之一炬" drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 0, CGImageGetWidth(imageCG),90) withAttributes:contentDict];
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
