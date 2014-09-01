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
    
    oneThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(200, 230, 164, 328)];
    oneThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:oneThumbView];
    
    twoThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(430, 230, 164, 328)];
    twoThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:twoThumbView];
    
    threeThumbView = [[ArticleThumbView alloc] initWithFrame:CGRectMake(660, 230, 164, 328)];
    threeThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:threeThumbView];
    
    leftArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftClick:)];
    [leftArrowView addGestureRecognizer:leftArrowTap];
    
    rightArrowTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightClick:)];
    [rightArrowView addGestureRecognizer:rightArrowTap];
}

-(void) leftClick:(UIGestureRecognizer *)recognizer
{
   NSLog(@"LEFT CLICK");
}

-(void) rightClick:(UIGestureRecognizer *)recognizer
{
    NSLog(@"RIGHT CLICK");
    /*
    [oneThumbView.layer pop_removeAllAnimations];
    POPSpringAnimation *animBlock = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock.toValue = [NSValue valueWithCGPoint:CGPointMake(oneThumbView.center.x - 364, oneThumbView.center.y)];
    [oneThumbView.layer pop_addAnimation:animBlock forKey:@"Animation"];
    
    [twoThumbView pop_removeAllAnimations];
    POPSpringAnimation *animBlock2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock2.toValue = [NSValue valueWithCGPoint:CGPointMake(twoThumbView.center.x - 594, twoThumbView.center.y)];
    [twoThumbView.layer pop_addAnimation:animBlock2 forKey:@"Animation"];
    */
    [threeThumbView pop_removeAllAnimations];
    POPSpringAnimation *animBlock3 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animBlock3.toValue = [NSValue valueWithCGPoint:CGPointMake(threeThumbView.center.x - 824, threeThumbView.center.y)];
    animBlock3.springSpeed = 1;
    [threeThumbView.layer pop_addAnimation:animBlock3 forKey:@"Animation"];
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
