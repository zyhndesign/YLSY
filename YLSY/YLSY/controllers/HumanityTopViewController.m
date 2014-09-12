//
//  HumanityTopViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HumanityTopViewController.h"

@interface HumanityTopViewController ()

@end

@implementation HumanityTopViewController

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
    self.view.backgroundColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    
    UIImage *titleImage = [UIImage imageNamed:@"humanityTitle"];
    titleLayer = [CALayer layer];
    titleLayer.contents = (__bridge id)[titleImage CGImage];
    titleLayer.position = CGPointMake(0.0, 0.0);
    titleLayer.anchorPoint = CGPointMake(0.5, 0.5);
    titleLayer.bounds = CGRectMake(0, 0, 601, 198);
    titleLayer.frame = CGRectMake(212, 200, 601, 198);
    [self.view.layer addSublayer:titleLayer];
    
    UIImage *imageRoom = [UIImage imageNamed:@"humanityRoom"];
    imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[imageRoom CGImage];
    imageLayer.position = CGPointMake(0.0, 0.0);
    imageLayer.anchorPoint = CGPointMake(0.5, 0.5);
    imageLayer.bounds = CGRectMake(0, 0, 571, 378);
    imageLayer.frame = CGRectMake(-200, 590, 571, 378);
    [self.view.layer addSublayer:imageLayer];
}

-(void) setLeftImagePosition:(float)position
{
    imageLayer.frame = CGRectMake(-200 + position, 590 - position, 571, 378);
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
