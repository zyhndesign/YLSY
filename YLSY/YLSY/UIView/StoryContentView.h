//
//  StoryContentView.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-9-3.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryContentView : UIView
{
    NSMutableArray *articleArray;
    UIViewController *controller;
}

- (id)initWithFrame:(CGRect)frame andController:(UIViewController *) _controller;

@property (nonatomic) NSMutableArray *articleArray;
@property (nonatomic) UIViewController *controller;
@end
