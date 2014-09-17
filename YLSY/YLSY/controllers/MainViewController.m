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
#import "../libs/pop/POPBasicAnimation.h"

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
    homeViewController.view.frame = CGRectMake(0, 0, 1024, 768);
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
    bottomViewController.view.frame = CGRectMake(0, viewHeight, 1024, 290);
    [mainScrollView addSubview:bottomViewController.view];
    [self addChildViewController:bottomViewController];
    
    viewHeight += bottomViewController.view.frame.size.height;
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, viewHeight);
    
    mainScrollView.bounces = YES;
    mainScrollView.delegate = self;
    mainScrollView.scrollEnabled = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setScrollToEnabled:) name:@"SET_SCRILLVIEW_SCROLL_ENABLE" object:nil];
    
    menuView = [[UIView alloc] initWithFrame:CGRectMake(0, -80, 1024, 80)];
    menuView.backgroundColor = [UIColor whiteColor];
    menuView.layer.opacity = 0.9;
    
    UIButton *historyBtn = [[UIButton alloc] initWithFrame:CGRectMake(330, 10, 80, 50)];
    [historyBtn setTitle:@"历史" forState:UIControlStateNormal];
    historyBtn.titleLabel.font = [UIFont systemFontOfSize:28];
    [historyBtn setTitleColor:[UIColor colorWithRed:254 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
    [historyBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [menuView addSubview:historyBtn];
    [historyBtn addTarget:self action:@selector(historyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *sceneBtn = [[UIButton alloc] initWithFrame:CGRectMake(420, 10, 80, 50)];
    [sceneBtn setTitle:@"景趣" forState:UIControlStateNormal];
    sceneBtn.titleLabel.font = [UIFont systemFontOfSize:28];
    [sceneBtn setTitleColor:[UIColor colorWithRed:254 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
    [sceneBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [menuView addSubview:sceneBtn];
    [sceneBtn addTarget:self action:@selector(sceneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *humanityBtn = [[UIButton alloc] initWithFrame:CGRectMake(524, 10, 80, 50)];
    [humanityBtn setTitle:@"人文" forState:UIControlStateNormal];
    humanityBtn.titleLabel.font = [UIFont systemFontOfSize:28];
    [humanityBtn setTitleColor:[UIColor colorWithRed:254 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
    [humanityBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [menuView addSubview:humanityBtn];
    [humanityBtn addTarget:self action:@selector(humanityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *storyBtn = [[UIButton alloc] initWithFrame:CGRectMake(614, 10, 80, 50)];
    [storyBtn setTitle:@"物象" forState:UIControlStateNormal];
    storyBtn.titleLabel.font = [UIFont systemFontOfSize:28];
    [storyBtn setTitleColor:[UIColor colorWithRed:254 green:0 blue:0 alpha:1] forState:UIControlStateNormal];
    [storyBtn.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [menuView addSubview:storyBtn];
    [storyBtn addTarget:self action:@selector(storyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    bottomLine = [CALayer layer];
    bottomLine.backgroundColor = [[UIColor colorWithRed:254.0 green:0 blue:0 alpha:1] CGColor];
    bottomLine.position = CGPointZero;
    bottomLine.anchorPoint = CGPointMake(0.5, 0.5);
    bottomLine.bounds = CGRectMake(0, 0, 80, 5);
    bottomLine.frame = CGRectMake(330, 55, 80, 5);
    [menuView.layer addSublayer:bottomLine];
    
    [self.view addSubview:menuView];
    menuView.hidden = YES;
}

-(void)historyBtnClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, 1536) animated:YES];
    [self bottomLineAnimation:370];
}

-(void)sceneBtnClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, 3072) animated:YES];
    [self bottomLineAnimation:460];
}

-(void)humanityBtnClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, 4608) animated:YES];
    [self bottomLineAnimation:564];
}

-(void)storyBtnClick:(id)sender
{
    [mainScrollView setContentOffset:CGPointMake(mainScrollView.frame.origin.x, 6144) animated:YES];
    [self bottomLineAnimation:654];
}

-(void)setScrollToEnabled:(NSNotification *)aNotification
{
    if (mainScrollView != nil)
    {
        mainScrollView.scrollEnabled = YES;
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"back to top .......");
    return NO;
}

-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offsetY = scrollView.contentOffset.y;
    if (offsetY > 1536 && offsetY < 3072)
    {
        [self bottomLineAnimation:370];
    }
    else if (offsetY > 3072 && offsetY < 4608)
    {
        [self bottomLineAnimation:460];
    }
    else if (offsetY > 4608 && offsetY < 6144)
    {
        [self bottomLineAnimation:564];
    }
    else if (offsetY > 6144)
    {
        [self bottomLineAnimation:654];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView
{
    newContentOffsetY = _scrollView.contentOffset.y;
    
    if (newContentOffsetY > 1536)
    {
        if ([menuView isHidden])
        {
            menuView.hidden = NO;
            
            [menuView pop_removeAllAnimations];
            POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
            anim.toValue = [NSValue valueWithCGPoint:CGPointMake(512, 40.0)];
            anim.duration = 1.5;
            [menuView pop_addAnimation:anim forKey:@"centerAnimation"];
        }
        
    }
    
    if (newContentOffsetY < 1536)
    {
        if (![menuView isHidden])
        {
            [menuView pop_removeAllAnimations];
            POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
            anim.toValue = [NSValue valueWithCGPoint:CGPointMake(512, -40.0)];
            anim.duration = 1.0;
            [anim setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
                if (isFinish)
                {
                    menuView.hidden = YES;
                }
            }];
            [menuView pop_addAnimation:anim forKey:@"centerAnimation"];
        }
    }
    
    if (newContentOffsetY > 400)
    {
        [recommandViewController initContentFlyIn];
    }
    
    if (newContentOffsetY > 1408 && newContentOffsetY < 1608)
    {
        [historyTopViewController setLeftImagePosition:(200 - (1608 - newContentOffsetY))];
    }
    
    if (newContentOffsetY > 2900 && newContentOffsetY < 3100)
    {
        [sceneTopViewController setLeftImagePosition:(200 - (3100 - newContentOffsetY))];
    }
    
    if (newContentOffsetY > 4390 && newContentOffsetY < 4590)
    {
        [humanityTopViewController setLeftImagePosition:(200 - (4590 - newContentOffsetY))];
    }
    
    if (newContentOffsetY > 4890)
    {
        [humanityViewController initContentFlyIn];
    }
    
    if (newContentOffsetY > 5990 && newContentOffsetY < 6190)
    {
        [storyTopViewController setLeftImagePosition:(200 - (6190 - newContentOffsetY))];
    }
    
    if (newContentOffsetY > 3400)
    {
        [sceneViewController initContentFlyIn];
    }
}

-(void) bottomLineAnimation:(float) toValue
{
    [bottomLine pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(toValue, 55.0)];
    anim.duration = 0.5;
    [bottomLine pop_addAnimation:anim forKey:@"centerAnimation"];
}

-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
