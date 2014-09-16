//
//  HistoryViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HistoryViewController.h"
#import "../UIView/HistoryScrollView.h"
#import "../UILayer/SlidingBlockLayer.h"
#import "../UIView/HistoryThumbView.h"
#import "../model/ArticleModel.h"
#import "../libs/pop/POPBasicAnimation.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImage *backgroundImage = [UIImage imageNamed:@"historyBackground"];
    self.view.layer.contents = (__bridge id)[backgroundImage CGImage];
    
    historyScrollView = [[HistoryScrollView alloc] initWithFrame:CGRectMake(0, 50, 1024, 668)];
    historyScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:historyScrollView];
    
    maskLayer = [CALayer layer];
    maskLayer.position = CGPointMake(0.0, 0.0);
    maskLayer.anchorPoint = CGPointMake(0.5, 0.5);
    maskLayer.frame = CGRectMake(0, 157, 1024, 290);
    maskLayer.backgroundColor = [[UIColor whiteColor] CGColor];
    maskLayer.opacity = 0.9;
    [self.view.layer addSublayer:maskLayer];
    
    leftArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftArrow"]];
    leftArrowView.frame = CGRectMake(80, 260, 45, 44);
    leftArrowView.userInteractionEnabled = YES;
    leftArrowView.hidden = YES;
    [self.view addSubview:leftArrowView];
    
    leftArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftArrowImageClick:)];
    [leftArrowView addGestureRecognizer:leftArrowTap];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.frame = CGRectMake(900, 260, 45, 44);
    rightArrowView.userInteractionEnabled = YES;
    [self.view addSubview:rightArrowView];
    
    rightArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightArrowImageClick:)];
    [rightArrowView addGestureRecognizer:rightArrowTap];
    
    contentLogoLayer = [CALayer layer];
    UIImage *image = [UIImage imageNamed:@"historyContentLogo"];
    contentLogoLayer.contents = (__bridge id)[image CGImage];
    contentLogoLayer.position = CGPointMake(0.0, 0.0);
    contentLogoLayer.anchorPoint = CGPointMake(0.5, 0.5);
    contentLogoLayer.frame = CGRectMake(300, 247, 385, 66);
    [self.view.layer addSublayer:contentLogoLayer];
    
    sliderBlockLayer = [SlidingBlockLayer layer];
    sliderBlockLayer.position = CGPointMake(0.0, 0.0);
    sliderBlockLayer.anchorPoint = CGPointMake(0.5, 0.5);
    sliderBlockLayer.frame = CGRectMake(-1050, 452, 2124, 258);
    [self.view.layer addSublayer:sliderBlockLayer];
    [sliderBlockLayer setNeedsDisplay];
    
    historyThumbView = [[HistoryThumbView alloc] initWithFrame:CGRectMake(1010, 210, 600, 200)];
    historyThumbView.backgroundColor = [UIColor clearColor];
    historyThumbView.hidden = TRUE;
    [self.view addSubview:historyThumbView];
    
    [self initTestData];
        
}

-(void)leftArrowImageClick:(UIGestureRecognizer *)gesture
{
    if ([dataArray count] > 0)
    {
        --countNum;
        
        ArticleModel *articleModel = (ArticleModel *)[dataArray objectAtIndex:countNum];
        
        historyThumbView.articleModel = articleModel;
        
        if (countNum == 0)
        {
            [leftArrowView setHidden:YES];
        }
        
        if ([rightArrowView isHidden])
        {
            [rightArrowView setHidden:NO];
        }
        [self contentPanelRightMoveOutAnimation];
        sliderBlockLayer.yearValue = articleModel.yearValue;
        [sliderBlockLayer setNeedsDisplay];
        int animToValue = (articleModel.yearValue - minYear) * percentageOfAxis;
        [self slideBlockAnim:animToValue];
    }
    
}


-(void)rightArrowImageClick:(UIGestureRecognizer *)gesture
{
    if ([dataArray count] > 0 && countNum < [dataArray count])
    {
        ArticleModel *articleModel = (ArticleModel *)[dataArray objectAtIndex:countNum];
        
        historyThumbView.articleModel = articleModel;
        
        ++countNum;
        
        if (countNum == [dataArray count])
        {
            [rightArrowView setHidden:YES];
        }
        
        if (countNum == 1)
        {
            [self logoImageMoveOutAnimation];
        }
        
        if ([leftArrowView isHidden])
        {
            [leftArrowView setHidden:NO];
        }
        [self contentPanelLeftMoveOutAnimation];
        sliderBlockLayer.yearValue = articleModel.yearValue;
         [sliderBlockLayer setNeedsDisplay];
        int animToValue = (articleModel.yearValue - minYear )* percentageOfAxis;
        [self slideBlockAnim:animToValue];
        
    }
    
}

-(void) contentPanelRightMoveInAnimation
{
    historyThumbView.hidden = NO;
    [historyThumbView setNeedsDisplay];
    [CATransaction begin];
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setDuration:0.8];
    [fadeIn setFromValue:[NSNumber numberWithFloat:0.0]];
    [fadeIn setToValue:[NSNumber numberWithFloat:1.0]];
    [historyThumbView.layer setOpacity:1.0];
    
    CABasicAnimation *moveIn = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveIn setDuration:1.0];
    [moveIn setFromValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x,historyThumbView.center.y)]];
    [moveIn setToValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x - 810,historyThumbView.center.y)]];
    historyThumbView.center  = CGPointMake(historyThumbView.center.x - 810, historyThumbView.center.y);
    
    [CATransaction setCompletionBlock:^{
        
    }];
    
    [historyThumbView.layer addAnimation:fadeIn forKey:nil];
    [historyThumbView.layer addAnimation:moveIn forKey:nil];
    [CATransaction commit];
}

-(void) contentPanelRightMoveOutAnimation
{
    [CATransaction begin];
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeOut setDuration:0.8];
    [fadeOut setFromValue:[NSNumber numberWithFloat:1.0]];
    [fadeOut setToValue:[NSNumber numberWithFloat:0.0]];
    [historyThumbView.layer setOpacity:0.0];
    
    CABasicAnimation *moveOut = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveOut setDuration:1.0];
    [moveOut setFromValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x,historyThumbView.center.y)]];
    [moveOut setToValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x + 810,historyThumbView.center.y)]];
    historyThumbView.center  = CGPointMake(historyThumbView.center.x + 810, historyThumbView.center.y);
    
    [CATransaction setCompletionBlock:^{
        historyThumbView.hidden = YES;
        
        if (countNum == 0)
        {
            [self logoImageMoveInAnimation];
        }
        else
        {
            historyThumbView.center  = CGPointMake(historyThumbView.center.x - 1620, historyThumbView.center.y);
            [self contentPanelLeftMoveInAnimation];
        }
    }];
    
    [historyThumbView.layer addAnimation:fadeOut forKey:nil];
    [historyThumbView.layer addAnimation:moveOut forKey:nil];
    [CATransaction commit];
}

-(void) contentPanelLeftMoveInAnimation
{
    [historyThumbView setNeedsDisplay];
    historyThumbView.hidden = NO;
    [CATransaction begin];
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setDuration:0.8];
    [fadeIn setFromValue:[NSNumber numberWithFloat:0.0]];
    [fadeIn setToValue:[NSNumber numberWithFloat:1.0]];
    [historyThumbView.layer setOpacity:1.0];
    
    CABasicAnimation *moveIn = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveIn setDuration:1.0];
    [moveIn setFromValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x,historyThumbView.center.y)]];
    [moveIn setToValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x + 810,historyThumbView.center.y)]];
    historyThumbView.center  = CGPointMake(historyThumbView.center.x + 810, historyThumbView.center.y);
    
    [CATransaction setCompletionBlock:^{
       
    }];
    
    [historyThumbView.layer addAnimation:fadeIn forKey:nil];
    [historyThumbView.layer addAnimation:moveIn forKey:nil];
    [CATransaction commit];
}

-(void) contentPanelLeftMoveOutAnimation
{
    [CATransaction begin];
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setDuration:0.6];
    [fadeIn setFromValue:[NSNumber numberWithFloat:1.0]];
    [fadeIn setToValue:[NSNumber numberWithFloat:0.0]];
    [historyThumbView.layer setOpacity:0.0];
    
    CABasicAnimation *moveIn = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveIn setDuration:1.0];
    [moveIn setFromValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x,historyThumbView.center.y)]];
    [moveIn setToValue:[NSValue valueWithCGPoint:CGPointMake(historyThumbView.center.x - 810,historyThumbView.center.y)]];
    historyThumbView.center  = CGPointMake(historyThumbView.center.x - 810, historyThumbView.center.y);
    
    [CATransaction setCompletionBlock:^{
        if (countNum <= [dataArray count])
        {
            historyThumbView.hidden = YES;
            historyThumbView.center  = CGPointMake(historyThumbView.center.x + 1620, historyThumbView.center.y);
            [self contentPanelRightMoveInAnimation];
        }
        else
        {
            [rightArrowView setHidden:YES];
        }
    }];
    
    [historyThumbView.layer addAnimation:fadeIn forKey:nil];
    [historyThumbView.layer addAnimation:moveIn forKey:nil];
    [CATransaction commit];
}

-(void) logoImageMoveInAnimation
{
    contentLogoLayer.hidden = NO;
    [CATransaction begin];
    CABasicAnimation *fadeIn = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeIn setDuration:1.0];
    [fadeIn setFromValue:[NSNumber numberWithFloat:0.0]];
    [fadeIn setToValue:[NSNumber numberWithFloat:1.0]];
    [contentLogoLayer setOpacity:1.0];
    
    CABasicAnimation *moveIn = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveIn setDuration:1.0];
    [moveIn setFromValue:[NSValue valueWithCGPoint:contentLogoLayer.position]];
    [moveIn setToValue:[NSValue valueWithCGPoint:CGPointMake(contentLogoLayer.position.x + 200, contentLogoLayer.position.y)]];
    [contentLogoLayer setPosition:CGPointMake(contentLogoLayer.position.x + 200, contentLogoLayer.position.y)];
    
    [CATransaction setCompletionBlock:^{
        contentLogoLayer.hidden = NO;
    }];
    
    [contentLogoLayer addAnimation:fadeIn forKey:nil];
    [contentLogoLayer addAnimation:moveIn forKey:nil];
    [CATransaction commit];
}

-(void) logoImageMoveOutAnimation
{
    [CATransaction begin];
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [fadeOut setDuration:1.0];
    [fadeOut setFromValue:[NSNumber numberWithFloat:1.0]];
    [fadeOut setToValue:[NSNumber numberWithFloat:0.0]];
    [contentLogoLayer setOpacity:0.0];
    
    CABasicAnimation *moveOut = [CABasicAnimation animationWithKeyPath:@"position"];
    [moveOut setDuration:1.0];
    [moveOut setFromValue:[NSValue valueWithCGPoint:contentLogoLayer.position]];
    [moveOut setToValue:[NSValue valueWithCGPoint:CGPointMake(contentLogoLayer.position.x - 200, contentLogoLayer.position.y)]];
    [contentLogoLayer setPosition:CGPointMake(contentLogoLayer.position.x - 200, contentLogoLayer.position.y)];
    
    [CATransaction setCompletionBlock:^{
        contentLogoLayer.hidden = YES;
        historyThumbView.hidden = NO;
        [self contentPanelRightMoveInAnimation];
    }];
    
    [contentLogoLayer addAnimation:fadeOut forKey:nil];
    [contentLogoLayer addAnimation:moveOut forKey:nil];
    [CATransaction commit];
}

-(void)slideBlockAnim:(float) toValue
{
    [sliderBlockLayer pop_removeAllAnimations];
    POPBasicAnimation *animBlock1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    NSLog(@"%f",toValue);
    animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(toValue + 12.0, sliderBlockLayer.position.y)];
    
    animBlock1.duration = 2.0;
    
    [sliderBlockLayer pop_addAnimation:animBlock1 forKey:@"Animation"];
}

-(void) initTestData
{
    countNum = 0;
    
    dataArray = [[NSMutableArray alloc] init];
    ArticleModel *articleModel = [ArticleModel new];
    articleModel.imagePath = @"historyContentPic";
    articleModel.titleText = @"[元朝书院]";
    articleModel.yearValue = 216;
    articleModel.contentText = @"216年始建于长沙城河西";
    [dataArray addObject:articleModel];
    
    articleModel = [ArticleModel new];
    articleModel.imagePath = @"historyContentPic";
    articleModel.titleText = @"[岳麓山]";
    articleModel.yearValue = 1216;
    articleModel.contentText = @"1216年始建于长沙城河西";
    [dataArray addObject:articleModel];
    
    articleModel = [ArticleModel new];
    articleModel.imagePath = @"historyContentPic";
    articleModel.titleText = @"[湖南大学]";
    articleModel.yearValue = 1902;
    articleModel.contentText = @"1902年始建于长沙城河西岳麓山大学城";
    [dataArray addObject:articleModel];
    
    articleModel = [ArticleModel new];
    articleModel.imagePath = @"historyContentPic";
    articleModel.titleText = @"[湖南师范大学]";
    articleModel.yearValue = 1922;
    articleModel.contentText = @"1922年始建于长沙城河西岳麓山大学城";
    [dataArray addObject:articleModel];
    
    articleModel = [ArticleModel new];
    articleModel.imagePath = @"historyContentPic";
    articleModel.titleText = @"[中南大学]";
    articleModel.yearValue = 1932;
    articleModel.contentText = @"1932年始建于长沙城河西岳麓山大学城";
    [dataArray addObject:articleModel];
    
    maxYear = 0;
    minYear = ((ArticleModel *)dataArray[0]).yearValue;
    
    for (ArticleModel *articleModel in dataArray)
    {
        if (minYear > articleModel.yearValue)
        {
            minYear = articleModel.yearValue;
        }
        
        if (maxYear < articleModel.yearValue)
        {
            maxYear = articleModel.yearValue;
        }
    }
    
    percentageOfAxis =  864.0 / (maxYear - minYear);
    
    if ([dataArray count] == 0)
    {
        [leftArrowView setHidden:TRUE];
        [rightArrowView setHidden:TRUE];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
