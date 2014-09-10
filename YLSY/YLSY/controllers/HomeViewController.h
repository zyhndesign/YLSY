//
//  HomeViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleDirectionBlockView;

@interface HomeViewController : UIViewController
{
    UIView *maskView;
    CALayer *mapLayer;
    CALayer *cloud1Layer;
    CALayer *cloud2Layer;
    CALayer *cloud3Layer;
    CALayer *cloud4Layer;
    CALayer *logoTextLayer;
    CALayer *logoLayer;
    
    UIImageView *upBtnImg;
    
    BOOL cloud1SwingAnimated;
    BOOL cloud2SwingAnimated;
    BOOL cloud3SwingAnimated;
    BOOL cloud4SwingAnimated;
    BOOL upBtnAnimated;
    //CALayer *articleMapLayer;
    
    ArticleDirectionBlockView *articleDirectionBlockView;
    
   // NSMutableArray *directionViewModelArray;
    NSMutableArray *directionViewArray;
    BOOL isAddDirectionView;
    BOOL isAnimation;
    BOOL isHidden;
}

@property (nonatomic) BOOL isAddDirectionView;

-(void)upBtnAnimation:(CALayer *)layer;

-(void) addArticleDirectionView;

-(void) hideAllArticleDirectionView;

-(void) addAnimForDirectionView;

-(void) animationForMapAndLogo;
@end
