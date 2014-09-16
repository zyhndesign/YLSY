//
//  HistoryThumbView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HistoryThumbView.h"
#import "../model/ArticleModel.h"

@implementation HistoryThumbView

@synthesize articleModel;

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
    UIImage *image = [UIImage imageNamed:articleModel.imagePath];
    CGImageRef imageCG = [image CGImage];
    [image drawAtPoint:CGPointZero];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    UIFont *font = [UIFont fontWithName:@"Courier" size:30];
    UIColor *textColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [[@"" stringByAppendingFormat:@"公元 %d 年",articleModel.yearValue] drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 0, 360,40) withAttributes:dict];
    
    font = [UIFont fontWithName:@"Courier" size:35];
    dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [articleModel.titleText drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 50, 360,40) withAttributes:dict];
    
    font = [UIFont fontWithName:@"Courier" size:23];
    paragraphStyle.lineBreakMode = kCTLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = 2.0;
    textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [articleModel.contentText drawInRect:CGRectMake(CGImageGetWidth(imageCG) + 10, 110, 360,30) withAttributes:dict];
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
