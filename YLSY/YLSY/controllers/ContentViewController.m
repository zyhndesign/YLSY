//
//  ContentViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-9-12.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backIcon"]];
    backImage.frame = CGRectMake(950, 30, 49, 53);
    backImage.userInteractionEnabled = YES;
    [self.view addSubview:backImage];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeBtn:)];
    [backImage addGestureRecognizer:tapGesture];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 83, 1024, 685)];
    [self.view addSubview:webView];
}

-(void) closeBtn:(UIGestureRecognizer *)gesture
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
