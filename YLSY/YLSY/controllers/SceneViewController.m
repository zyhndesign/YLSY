//
//  SceneViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "SceneViewController.h"
#import "../UIView/ArticleThumbView.h"
#import "../libs/pop/POPSpringAnimation.h"
#import "../libs/pop/POPBasicAnimation.h"
#import "ContentViewController.h"

@interface SceneViewController ()

@end

@implementation SceneViewController

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
    leftArrowView.frame = CGRectMake(80, 380, 45, 44);
    leftArrowView.userInteractionEnabled = YES;
    [self.view addSubview:leftArrowView];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.frame = CGRectMake(900, 380, 45, 44);
    rightArrowView.userInteractionEnabled = YES;
    [self.view addSubview:rightArrowView];
    
    oneThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(1024, 230, 164, 328)];
    oneThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:oneThumbView];
    UITapGestureRecognizer *viewTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(articleTap:)];
    [oneThumbView addGestureRecognizer:viewTap1];
    
    twoThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(1024, 230, 164, 328)];
    twoThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:twoThumbView];
    UITapGestureRecognizer *viewTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(articleTap:)];
    [twoThumbView addGestureRecognizer:viewTap2];
    
    threeThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(1024, 230, 164, 328)];
    threeThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:threeThumbView];
    UITapGestureRecognizer *viewTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(articleTap:)];
    [threeThumbView addGestureRecognizer:viewTap3];
    
    leftArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftClick:)];
    [leftArrowView addGestureRecognizer:leftArrowTap];
    
    rightArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightClick:)];
    [rightArrowView addGestureRecognizer:rightArrowTap];
    
    pageNum = 10;
    currentPage = 0;
    
    pageController = [[UIPageControl alloc] init];
    pageController.center = CGPointMake(self.view.center.x, 630);
    pageController.numberOfPages = pageNum;
    pageController.currentPage = currentPage;
    pageController.pageIndicatorTintColor = [UIColor grayColor];
    pageController.currentPageIndicatorTintColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    [self.view addSubview:pageController];
    
    firstInit = YES;
    
    //-------------------------------------------------------------------------------
    //添加手势识别
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] init];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeLeft];
    [swipeLeft addTarget:self action:@selector(leftClick:)];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] init];
    swipeRight.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRight];
    [swipeRight addTarget:self action:@selector(rightClick:)];
}

-(void) initContentFlyIn
{
    if (firstInit)
    {
        firstInit = NO;
        [self springAnim:oneThumbView andPosition:290];
        [self springAnim:twoThumbView andPosition:520];
        [self springAnim:threeThumbView andPosition:750];
    }
}

-(void)articleTap:(UIGestureRecognizer *) gesture
{
    ArticleThumbView *blockView = (ArticleThumbView *)gesture.view;
    
    ContentViewController *content = [[ContentViewController alloc] init];
    [self presentViewController:content animated:YES completion:^{
        
    }];
}

-(void) springAnim:(UIView *)view andPosition:(float) position
{
    [view.layer pop_removeAllAnimations];
    POPSpringAnimation *animBlock1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(position, oneThumbView.center.y)];
    animBlock1.springSpeed = 1;
    animBlock1.springBounciness = 6;
    [view.layer pop_addAnimation:animBlock1 forKey:@"Animation"];
}

-(void) leftClick:(UIGestureRecognizer *)recognizer
{
    if (currentPage > 0)
    {
        NSLog(@"LEFT CLICK");
        [leftArrowView setUserInteractionEnabled:NO];
        [oneThumbView.layer pop_removeAllAnimations];
        POPBasicAnimation *animBlock1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(oneThumbView.center.x + 988, oneThumbView.center.y)];
        animBlock1.duration = 0.3;
        [animBlock1 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                
                [oneThumbView.layer pop_removeAllAnimations];
                oneThumbView.center = CGPointMake(oneThumbView.center.x - 1024, oneThumbView.center.y);
                
                POPSpringAnimation *animNestBlock1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(282, oneThumbView.center.y)];
                animNestBlock1.springSpeed = 1;
                [oneThumbView pop_addAnimation:animNestBlock1 forKey:@"Animation"];
                
            }
        }];
        [oneThumbView.layer pop_addAnimation:animBlock1 forKey:@"Animation"];
        
        [twoThumbView pop_removeAllAnimations];
        POPBasicAnimation *animBlock2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(twoThumbView.center.x + 758, twoThumbView.center.y)];
        animBlock2.duration = 0.3;
        [animBlock2 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                [twoThumbView pop_removeAllAnimations];
                twoThumbView.center = CGPointMake(twoThumbView.center.x - 1024, twoThumbView.center.y);
                POPSpringAnimation *animNestBlock2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(512, twoThumbView.center.y)];
                animNestBlock2.springSpeed = 1;
                [twoThumbView pop_addAnimation:animNestBlock2 forKey:@"Animation"];
            }
        }];
        [twoThumbView.layer pop_addAnimation:animBlock2 forKey:@"Animation"];
        
        [threeThumbView pop_removeAllAnimations];
        POPBasicAnimation *animBlock3 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock3.toValue = [NSValue valueWithCGPoint:CGPointMake(threeThumbView.center.x + 528, threeThumbView.center.y)];
        animBlock3.duration = 0.3;
        
        [animBlock3 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                [threeThumbView pop_removeAllAnimations];
                threeThumbView.center = CGPointMake(threeThumbView.center.x - 1024, threeThumbView.center.y);
                POPSpringAnimation *animNestBlock3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock3.toValue = [NSValue valueWithCGPoint:CGPointMake(742, oneThumbView.center.y)];
                animNestBlock3.springSpeed = 1;
                [threeThumbView pop_addAnimation:animNestBlock3 forKey:@"Animation"];
                [leftArrowView setUserInteractionEnabled:YES];
            }
        }];
        [threeThumbView.layer pop_addAnimation:animBlock3 forKey:@"Animation"];
        currentPage--;
        rightArrowView.hidden = NO;
        if (currentPage == 0)
        {
            leftArrowView.hidden = YES;
        }
    }
    
    pageController.currentPage = currentPage;
}

-(void) rightClick:(UIGestureRecognizer *)recognizer
{
    if (currentPage < pageNum)
    {
        NSLog(@"RIGHT CLICK");
        [rightArrowView setUserInteractionEnabled:NO];
        [oneThumbView.layer pop_removeAllAnimations];
        POPBasicAnimation *animBlock1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(oneThumbView.center.x - 364, oneThumbView.center.y)];
        animBlock1.duration = 0.3;
        [animBlock1 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                
                [oneThumbView.layer pop_removeAllAnimations];
                oneThumbView.center = CGPointMake(oneThumbView.center.x + 1024, oneThumbView.center.y);
                
                POPSpringAnimation *animNestBlock1 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock1.toValue = [NSValue valueWithCGPoint:CGPointMake(282, oneThumbView.center.y)];
                animNestBlock1.springSpeed = 1;
                [oneThumbView pop_addAnimation:animNestBlock1 forKey:@"Animation"];
                
            }
        }];
        [oneThumbView.layer pop_addAnimation:animBlock1 forKey:@"Animation"];
        
        [twoThumbView pop_removeAllAnimations];
        POPBasicAnimation *animBlock2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(twoThumbView.center.x - 594, twoThumbView.center.y)];
        animBlock2.duration = 0.3;
        [animBlock2 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                [twoThumbView pop_removeAllAnimations];
                twoThumbView.center = CGPointMake(twoThumbView.center.x + 1024, twoThumbView.center.y);
                POPSpringAnimation *animNestBlock2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(512, twoThumbView.center.y)];
                animNestBlock2.springSpeed = 1;
                [twoThumbView pop_addAnimation:animNestBlock2 forKey:@"Animation"];
            }
        }];
        [twoThumbView.layer pop_addAnimation:animBlock2 forKey:@"Animation"];
        
        [threeThumbView pop_removeAllAnimations];
        POPBasicAnimation *animBlock3 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animBlock3.toValue = [NSValue valueWithCGPoint:CGPointMake(threeThumbView.center.x - 824, threeThumbView.center.y)];
        animBlock3.duration = 0.3;
        
        [animBlock3 setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
            if (isFinish)
            {
                [threeThumbView pop_removeAllAnimations];
                threeThumbView.center = CGPointMake(threeThumbView.center.x + 1024, threeThumbView.center.y);
                POPSpringAnimation *animNestBlock3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
                animNestBlock3.toValue = [NSValue valueWithCGPoint:CGPointMake(742, oneThumbView.center.y)];
                animNestBlock3.springSpeed = 1;
                [threeThumbView pop_addAnimation:animNestBlock3 forKey:@"Animation"];
                [rightArrowView setUserInteractionEnabled:YES];
            }
        }];
        [threeThumbView.layer pop_addAnimation:animBlock3 forKey:@"Animation"];
        leftArrowView.hidden = NO;
        ++currentPage;
        if (currentPage == pageNum - 1)
        {
            rightArrowView.hidden = YES;
        }
    }
    
    pageController.currentPage = currentPage;
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
