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
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    UIGraphicsBeginImageContext(image.size);
    CGContextRef gc = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(gc, CGRectMake(0, 0, width - 3, height - 3));
    CGContextClosePath(gc);
    CGContextClip(gc);
    CGContextTranslateCTM(gc, 0, height);
    CGContextScaleCTM(gc, 1, -1);
    CGContextDrawImage(gc, CGRectMake(0, 0, width, height), [image CGImage]);
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[UIGraphicsGetImageFromCurrentImageContext() CGImage];
    imageLayer.frame = CGRectMake(0, 0, width, height);
    [self.layer addSublayer:imageLayer];
    
    UIGraphicsEndImageContext();
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *font = [UIFont fontWithName:@"Courier" size:30];
    UIColor *textColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName,textColor, NSForegroundColorAttributeName, nil];
    [@"[朱熹]" drawInRect:CGRectMake(0,height + 25,width,40) withAttributes:dict];
    
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
