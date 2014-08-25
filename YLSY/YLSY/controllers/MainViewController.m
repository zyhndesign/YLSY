//
//  MainViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "RecommandViewController.h"
#import "HistoryTopViewController.h"
#import "HistoryViewController.h"
#import "HumanityTopViewController.h"
#import "HumanityViewController.h"
#import "SceneTopViewController.h"
#import "SceneViewController.h"
#import "StoryTopViewController.h"
#import "StoryViewController.h"
#import "BottomViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize mainScrollView;

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
        
    homeViewController = [[HomeViewController alloc] init];
    homeViewController.view.frame = CGRectMake(0, 0, 1024, 1536);
    [mainScrollView addSubview:homeViewController.view];
    [self addChildViewController:homeViewController];
    
    viewHeight = 0;
    viewHeight += homeViewController.view.frame.size.height;
    
    recommandViewController = [[RecommandViewController alloc] init];
    recommandViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:recommandViewController.view];
    [self addChildViewController:recommandViewController];
    
    viewHeight += recommandViewController.view.frame.size.height;
    historyTopViewController = [[HistoryTopViewController alloc] init];
    historyTopViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:historyTopViewController.view];
    [self addChildViewController:historyTopViewController];
    
    viewHeight += historyTopViewController.view.frame.size.height;
    historyViewController = [[HistoryViewController alloc] init];
    historyViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:historyViewController.view];
    [self addChildViewController:historyViewController];
    
    viewHeight += historyViewController.view.frame.size.height;
    sceneTopViewController = [[SceneTopViewController alloc] init];
    sceneTopViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:sceneTopViewController.view];
    [self addChildViewController:sceneTopViewController];
    
    viewHeight += sceneTopViewController.view.frame.size.height;
    sceneViewController = [[SceneViewController alloc] init];
    sceneViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:sceneViewController.view];
    [self addChildViewController:sceneViewController];
    
    viewHeight += sceneViewController.view.frame.size.height;
    humanityTopViewController = [[HumanityTopViewController alloc] init];
    humanityTopViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:humanityTopViewController.view];
    [self addChildViewController:humanityTopViewController];
    
    viewHeight += humanityTopViewController.view.frame.size.height;
    humanityViewController = [[HumanityViewController alloc] init];
    humanityViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:humanityViewController.view];
    [self addChildViewController:humanityViewController];
    
    viewHeight += humanityViewController.view.frame.size.height;
    storyTopViewController = [[StoryTopViewController alloc] init];
    storyTopViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:storyTopViewController.view];
    [self addChildViewController:storyTopViewController];
    
    viewHeight += storyTopViewController.view.frame.size.height;
    storyViewController = [[StoryViewController alloc] init];
    storyViewController.view.frame = CGRectMake(0, viewHeight, 1024, 768);
    [mainScrollView addSubview:storyViewController.view];
    [self addChildViewController:storyViewController];
    
    viewHeight += storyViewController.view.frame.size.height;
    bottomViewController = [[BottomViewController alloc] init];
    bottomViewController.view.frame = CGRectMake(0, viewHeight, 1024, 438);
    [mainScrollView addSubview:bottomViewController.view];
    [self addChildViewController:bottomViewController];
    
    viewHeight += bottomViewController.view.frame.size.height;
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, viewHeight);
    
    mainScrollView.bounces = NO;
    mainScrollView.delegate = self;
    
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"back to top .......");
    return NO;
}

-(void) scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    oldContentOffsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    newContentOffsetY = _scrollView.contentOffset.y;
    
    if (newContentOffsetY < 768)
    {
        CGFloat diff = newContentOffsetY - oldContentOffsetY;
        //[homeViewController executeScrollMap:diff];
    }
    
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
