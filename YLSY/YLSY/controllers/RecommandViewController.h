//
//  RecommandViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleThumbView;

@interface RecommandViewController : UIViewController
{
    CALayer *backgroundLayer;
    CALayer *titleLayer;
    UIImageView *leftArrowView;
    UIImageView *rightArrowView;
    
    ArticleThumbView *oneThumbView;
    ArticleThumbView *twoThumbView;
    ArticleThumbView *threeThumbView;
    
    UITapGestureRecognizer *leftArrowTap;
    UITapGestureRecognizer *rightArrowTap;
}
@end
