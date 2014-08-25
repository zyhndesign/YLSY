//
//  HumanityThumbView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HumanityThumbView.h"

@implementation HumanityThumbView

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
    UIImage *image = [UIImage imageNamed:@"human1"];
    CGImageRef imageCG = [image CGImage];
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[image CGImage];
    imageLayer.masksToBounds = YES;
    imageLayer.frame = CGRectMake(0, 0, CGImageGetWidth(imageCG), CGImageGetHeight(imageCG));
    imageLayer.cornerRadius = 103;
    [self.layer addSublayer:imageLayer];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *font = [UIFont fontWithName:@"Courier" size:30];
    UIColor *textColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [@"[朱熹]" drawInRect:CGRectMake(0,CGImageGetHeight(imageCG) + 25,CGImageGetWidth(imageCG),40) withAttributes:dict];
    
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
