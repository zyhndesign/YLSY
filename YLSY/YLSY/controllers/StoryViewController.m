//
//  StoryViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "StoryViewController.h"
#import "../model/ArticleModel.h"
#import "../UIView/StoryContentView.h"
#import "../libs/pop/POPSpringAnimation.h"
#import "../libs/pop/POPBasicAnimation.h"

@interface StoryViewController ()

@end

@implementation StoryViewController

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
    
    leftArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftArrow"]];
    leftArrowView.frame = CGRectMake(40, 380, 45, 44);
    leftArrowView.userInteractionEnabled = YES;
    [self.view addSubview:leftArrowView];
    
    UITapGestureRecognizer *leftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(leftArrowTapClick:)];
    [leftArrowView addGestureRecognizer:leftGesture];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.userInteractionEnabled = YES;
    rightArrowView.frame = CGRectMake(940, 380, 45, 44);
    [self.view addSubview:rightArrowView];
    
    UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(rightArrowTapClick:)];
    [rightArrowView addGestureRecognizer:rightGesture];
    
    NSMutableArray *array = [NSMutableArray new];
    ArticleModel *articleModel= [ArticleModel new];
    articleModel.articleId = 1;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 2;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 3;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 4;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 5;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 6;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 7;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 8;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 9;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 10;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 11;
    [array addObject:articleModel];
    
    articleModel= [ArticleModel new];
    articleModel.articleId = 12;
    [array addObject:articleModel];
    
    contentView1 = [[StoryContentView alloc] initWithFrame:CGRectMake(100, 150, 850, 560)];
    contentView1.backgroundColor = [UIColor clearColor];
    contentView1.articleArray = array;
    contentView1ISBack = NO;
    [self.view addSubview:contentView1];
    
    contentView2 = [[StoryContentView alloc] initWithFrame:CGRectMake(100, 150, 850, 560)];
    contentView2.backgroundColor = [UIColor clearColor];
    contentView2.articleArray = array;
    contentView2.transform = CGAffineTransformMakeScale(0.5, 0.5);
    contentView2.hidden = YES;
    contentView2ISBack = YES;
    [self.view addSubview:contentView2];
}

-(void)leftArrowTapClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"Left Click");
    if (contentView2ISBack)
    {
        [self executeLeftButtonAnimOfFrontView:contentView1 AndBackView:contentView2];
        leftSign = YES;
    }
    else
    {
        [self executeLeftButtonAnimOfFrontView:contentView2 AndBackView:contentView1];
        leftSign = NO;
    }
}

-(void) executeLeftButtonAnimOfFrontView:(UIView *)view1 AndBackView:(UIView *)view2
{
    [view1 pop_removeAllAnimations];
    POPSpringAnimation *animBlock1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(1455, view1.center.y)];
    animBlock1.springSpeed = 1;
    animBlock1.springBounciness = 0;
    [animBlock1 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
        view1.hidden = YES;
        view1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        view1.center = CGPointMake(525, 430);
        
        if (leftSign)
        {
            contentView1ISBack = YES;
        }
        else
        {
            contentView2ISBack = YES;
        }
    }];
    [view1.layer pop_addAnimation:animBlock1 forKey:@"Animation"];
    
    [view2 pop_removeAllAnimations];
    view2.hidden = NO;
    POPBasicAnimation *animBlock2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    animBlock2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [animBlock2 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
        if (leftSign)
        {
            contentView2ISBack = NO;
        }
        else
        {
            contentView1ISBack = NO;
        }
    }];
    [view2.layer pop_addAnimation:animBlock2 forKey:@"Animation"];
}

-(void)rightArrowTapClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"Right Click");
    if (contentView2ISBack)
    {
        [self executeRightButtonAnimOfFrontView:contentView1 AndBackView:contentView2];
        rightSign = YES;
    }
    else
    {
        [self executeRightButtonAnimOfFrontView:contentView2 AndBackView:contentView1];
        rightSign = NO;
    }
}

-(void) executeRightButtonAnimOfFrontView:(UIView *)view1 AndBackView:(UIView *)view2
{
    [view1 pop_removeAllAnimations];
    POPSpringAnimation *animBlock1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(-575, view1.center.y)];
    animBlock1.springSpeed = 1;
    animBlock1.springBounciness = 0;
    [animBlock1 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
        view1.hidden = YES;
        view1.transform = CGAffineTransformMakeScale(0.5, 0.5);
        view1.center = CGPointMake(525, 430);
        if (rightSign)
        {
            contentView1ISBack = YES;
        }
        else
        {
            contentView2ISBack = YES;
        }
    }];
    [view1.layer pop_addAnimation:animBlock1 forKey:@"Animation"];
    
    [view2 pop_removeAllAnimations];
    view2.hidden = NO;
    POPBasicAnimation *animBlock2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    animBlock2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [animBlock2 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
        if (rightSign)
        {
            contentView2ISBack = NO;
        }
        else
        {
            contentView1ISBack = NO;
        }
    }];
    [view2.layer pop_addAnimation:animBlock2 forKey:@"Animation"];
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
