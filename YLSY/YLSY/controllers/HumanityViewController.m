//
//  HumanityViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HumanityViewController.h"
#import "../UIView/HumanityThumbView.h"
#import "../libs/pop/POPDecayAnimation.h"

@interface HumanityViewController ()

@end

@implementation HumanityViewController

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
    
    UITapGestureRecognizer *leftGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftArrowViewClick:)];
    [leftArrowView addGestureRecognizer:leftGesture];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.frame = CGRectMake(900, 380, 45, 44);
    rightArrowView.userInteractionEnabled = YES;
    [self.view addSubview:rightArrowView];
    
    UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightArrowViewClick:)];
    [rightArrowView addGestureRecognizer:rightGesture];
    
    oneThumbView = [[HumanityThumbView alloc] initWithFrame:CGRectMake(200, 230, 201, 300)];
    oneThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:oneThumbView];
    
    twoThumbView = [[HumanityThumbView alloc] initWithFrame:CGRectMake(426, 230, 201, 300)];
    twoThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:twoThumbView];
    
    threeThumbView = [[HumanityThumbView alloc] initWithFrame:CGRectMake(642, 230, 201, 300)];
    threeThumbView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:threeThumbView];
}

-(void)leftArrowViewClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"Left Click....");
    [oneThumbView pop_removeAllAnimations];
    POPDecayAnimation *decayAnim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerRotationY];
    decayAnim.fromValue = @(0);
    decayAnim.velocity = @(0.5);
    [oneThumbView pop_addAnimation:decayAnim forKey:@"Animation"];
}

-(void)rightArrowViewClick:(UIGestureRecognizer *)gesture
{
    NSLog(@"Right Click....");
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
