//
//  HistoryViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HistoryScrollView;
@class SlidingBlockLayer;
@class HistoryThumbView;

@interface HistoryViewController : UIViewController
{    
    UIImageView *leftArrowView;
    UIImageView *rightArrowView;
    
    HistoryScrollView *historyScrollView;
    
    CALayer *contentLogoLayer;
    
    CALayer *maskLayer;
    
    SlidingBlockLayer *sliderBlockLayer;
    
    UITapGestureRecognizer *leftArrowTap;
    UITapGestureRecognizer *rightArrowTap;
    
    HistoryThumbView *historyThumbView;
    
    NSMutableArray *dataArray;
    
    //用于计数内容当前访问位置
    int countNum;
    
    
}

/**
 *  <#Description#>
 *
 *  @param gesture <#gesture description#>
 */
-(void)leftArrowImageClick:(UIGestureRecognizer *)gesture;

/**
 *  <#Description#>
 *
 *  @param gesture <#gesture description#>
 */
-(void)rightArrowImageClick:(UIGestureRecognizer *)gesture;

/**
 *  <#Description#>
 */
-(void) contentPanelRightMoveInAnimation;

/**
 *  <#Description#>
 */
-(void) contentPanelRightMoveOutAnimation;

/**
 *  <#Description#>
 */
-(void) contentPanelLeftMoveInAnimation;

/**
 *  <#Description#>
 */
-(void) contentPanelLeftMoveOutAnimation;

/**
 *  <#Description#>
 */
-(void) logoImageMoveInAnimation;

/**
 *  <#Description#>
 */
-(void) logoImageMoveOutAnimation;
@end
