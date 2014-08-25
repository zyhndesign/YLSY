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
    self.view.backgroundColor = [UIColor colorWithRed:254 green:0 blue:0 alpha:1];
    
    UIImage *imageRoom = [UIImage imageNamed:@"footerImage"];
    imageLayer = [CALayer layer];
    imageLayer.contents = (__bridge id)[imageRoom CGImage];
    imageLayer.position = CGPointMake(0.0, 0.0);
    imageLayer.anchorPoint = CGPointMake(0.5, 0.5);
    imageLayer.bounds = CGRectMake(0, 0, 290, 290);
    imageLayer.frame = CGRectMake(0, 0, 290, 290);
    [self.view.layer addSublayer:imageLayer];
    
    downloadImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"download"]];
    downloadImageView.frame = CGRectMake(450, 30, 124, 22);
    [self.view addSubview:downloadImageView];
    
    copyRightLabel = [[UILabel alloc]initWithFrame:CGRectMake(352, 200, 300, 40)];
    copyRightLabel.text = @"@湖南省工业设计协会版权所有";
    copyRightLabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
    copyRightLabel.font = [UIFont fontWithName:@"Arial" size:16];
    copyRightLabel.textAlignment = UITextAlignmentCenter;
    [self.view addSubview:copyRightLabel];
    
    developerlabel = [[UILabel alloc] initWithFrame:CGRectMake(352, 240, 300, 40)];
    developerlabel.text = @"中意工业设计（湖南）有限责任公司";
    developerlabel.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1];
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
