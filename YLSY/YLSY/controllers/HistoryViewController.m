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
    [self.view addSubview:leftArrowView];
    
    rightArrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    rightArrowView.frame = CGRectMake(900, 260, 45, 44);
    [self.view addSubview:rightArrowView];
    
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
    sliderBlockLayer.frame = CGRectMake(300, 462, 60, 248);
    [self.view.layer addSublayer:sliderBlockLayer];
    [sliderBlockLayer setNeedsDisplay];

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
