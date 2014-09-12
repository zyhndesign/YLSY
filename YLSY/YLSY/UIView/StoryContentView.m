//
//  StoryContentView.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-9-3.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "StoryContentView.h"
#import "../model/ArticleModel.h"
#import "ContentViewController.h"

@implementation StoryContentView

@synthesize articleArray, controller;

static int a[15][2] = {
    {0,5},{165,5},{330,5},{495,5},{660,5},
    {0,170},{165,170},{330,170},{495,170},{660,170},
    {0,335},{165,335},{330,335},{495,335},{660,335}};

- (id)initWithFrame:(CGRect)frame andController:(UIViewController *) _controller
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.controller = _controller;
    }
    return self;
}

-(void) drawRect:(CGRect)rect
{
    if ([articleArray count] > 0)
    {
        UIImageView *image = nil;
        int i = 0;
        
        for (ArticleModel *articleModel in articleArray)
        {
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(tapImage:)];
            image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pic1"]];
            image.userInteractionEnabled = YES;
            image.frame = CGRectMake(a[i][0], a[i][1], 160, 160);
            image.tag = articleModel.articleId;
            [image addGestureRecognizer:tapGesture];
            [self addSubview:image];
            i++;
        }
    }
}

-(void) tapImage:(UIGestureRecognizer *)gesture
{
    NSLog(@"%ld",(long)gesture.view.tag);
    ContentViewController *content = [[ContentViewController alloc] init];
    [controller.self presentViewController:content animated:YES completion:^{
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
