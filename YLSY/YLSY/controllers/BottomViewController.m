//
//  BottomViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-25.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "BottomViewController.h"

@interface BottomViewController ()

@end

@implementation BottomViewController

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
    UIImage *imageRoom = [UIImage imageNamed:@"humanityRoom"];
    imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[imageRoom CGImage];
    imageLayer.position = CGPointMake(0.0, 0.0);
    imageLayer.anchorPoint = CGPointMake(0.5, 0.5);
    imageLayer.bounds = CGRectMake(0, 0, 571, 378);
    imageLayer.frame = CGRectMake(0, 390, 571, 378);
    [self.view.layer addSublayer:imageLayer];
    
    downloadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    downloadImageView.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>);
    [self.view addSubview:downloadImageView];
    
    copyRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(412, 250, 200, 60)];
    copyRightLabel.text = @"@湖南省工业设计协会版权所有";
    copyRightLabel.textColor = [UIColor colorWithRed:228 green:0 blue:18 alpha:1];
    copyRightLabel.font = [UIFont fontWithName:@"Arial" size:16];
    copyRightLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:copyRightLabel];
    
    developerlabel = [[UILabel alloc] initWithFrame:CGRectMake(412, 360, 200, 60)];
    developerlabel.text = @"中意工业设计（湖南）有限责任公司";
    developerlabel.textColor = [UIColor colorWithRed:228 green:0 blue:18 alpha:1];
    developerlabel.font = [UIFont fontWithName:@"Arial" size:16];
    developerlabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:developerlabel];
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
