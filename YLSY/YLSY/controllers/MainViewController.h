//
//  MainViewController.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeViewController;
@class RecommandViewController;
@class HistoryTopViewController;
@class HistoryViewController;
@class HumanityTopViewController;
@class HumanityViewController;
@class SceneTopViewController;
@class SceneViewController;
@class StoryTopViewController;
@class StoryViewController;
@class BottomViewController;

@interface MainViewController : UIViewController<UIScrollViewDelegate>
{
    HomeViewController *homeViewController;
    RecommandViewController *recommandViewController;
    HistoryTopViewController *historyTopViewController;
    HistoryViewController *historyViewController;
    HumanityTopViewController *humanityTopViewController;
    HumanityViewController *humanityViewController;
    SceneTopViewController *sceneTopViewController;
    SceneViewController *sceneViewController;
    StoryTopViewController *storyTopViewController;
    StoryViewController *storyViewController;
    BottomViewController *bottomViewController;
    
    IBOutlet UIScrollView *mainScrollView;
    
    CGFloat contentOffsetY;
    CGFloat oldContentOffsetY;
    CGFloat newContentOffsetY;
    
    int viewHeight;
}
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;

@end
