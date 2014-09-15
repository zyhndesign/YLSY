//
//  StoryViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoryContentView;

@interface StoryViewController : UIViewController
{
    UIImageView *leftArrowView;
    UIImageView *rightArrowView;
    
    StoryContentView *contentView1;
    StoryContentView *contentView2;
    
    BOOL contentView1ISBack;
    BOOL contentView2ISBack;
    
    BOOL leftSign;
    BOOL rightSign;
    
    UIPageControl *pageController;
}
@end
