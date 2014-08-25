//
//  RecommandViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "RecommandViewController.h"
#import "../UIView/ArticleThumbView.h"

@interface RecommandViewController ()

@end

@implementation RecommandViewController

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
    
    backgroundLayer = [CALayer layer];
    UIImage *backgroundImage = [UIImage imageNamed:@"recommandTopicBg"];
    backgroundLayer.contents = (__bridge id)[backgroundImage CGImage];
    backgroundLayer.position = CGPointMake(0.0, 0.0);
    backgroundLayer.anchorPoint = CGPointMake(0.5, 0.5);
    backgroundLayer.bounds = CGRectMake(0, 0, 1024, 768);
    backgroundLayer.frame = CGRectMake(0, 0, 1024, 768);
    [self.view.layer addSublayer:backgroundLayer];
    
    titleLayer = [CALayer layer];
    UIImage *titleImage = [UIImage imageNamed:@"recommandText"];
    titleLayer.contents = (__bridge id)[titleImage CGImage];
    titleLayer.position = CGPointZero;
    titleLayer.anchorPoint = CGPointMake(0.5, 0.5);
    titleLayer.bounds = CGRectMake(0, 0, 321, 59);
    titleLayer.frame = CGRectMake(350, 80, 321, 59);
    [self.view.layer addSublayer:titleLayer];
    
    leftArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftArrow"]];
    leftArrowView.frame = CGRectMake(80, 380, 45, 44);
    [self.view addSubview:leftArrowView];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.frame = CGRectMake(900, 380, 45, 44);
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
