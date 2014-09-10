//
//  HomeViewController.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-21.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "HomeViewController.h"
#import "../libs/pop/POPDecayAnimation.h"
#import "../tools/POPAnimationManager.h"
#import "../libs/pop/POPBasicAnimation.h"
#import "../libs/pop/POPSpringAnimation.h"
#import "../UIView/ArticleDirectionBlockView.h"
#import "../model/ArticleMapDirectionViewModel.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize isAddDirectionView;

static const int articleArraySign[27][3] = {
    {280,452,30},{330,402,30},{438,307,30},{410,208,30},{510,248,30},
    {650,288,30},{580,418,30},{680,538,30},{680,368,30},{718,302,30},
    {823,328,30},{853,208,30},{630,158,30},{570,110,30},{730,200,15},
    {755,178,5},{795,184,15},{675,50,30},{765,93,20},{800,110,10},
    {840,125,10},{845,55,10},{885,62,20},{775,0,30},{590,0,30},
    {345,32,30},{115,352,30}
};

static const int ARTICLE_NUMBER = 27;

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
    
    mapLayer = [CALayer layer];
    UIImage *mapImage = [UIImage imageNamed:@"yueluAcademicMap"];
    mapLayer.contents = (__bridge id)[mapImage CGImage];
    mapLayer.position = CGPointMake(0.0, 0.0);
    mapLayer.anchorPoint = CGPointMake(0.5, 0.5);
    mapLayer.bounds = CGRectMake(0, 0, 1024, 768);
    mapLayer.frame = CGRectMake(0, 0, 1024, 768);
    mapLayer.opacity = 0.6;
    [self.view.layer addSublayer:mapLayer];
    
    logoLayer = [CALayer layer];
    UIImage *logoImage = [UIImage imageNamed:@"yueluAcademicMapSeal"];
    //logoLayer.backgroundColor = [[UIColor blackColor] CGColor];
    logoLayer.contents = (__bridge id)[logoImage CGImage];
    logoLayer.position = CGPointMake(0.0, 0.0);
    logoLayer.anchorPoint = CGPointMake(0.5, 0.5);
    logoLayer.bounds = CGRectMake(0, 0, 63, 196);
    logoLayer.frame = CGRectMake(100, 80, 63, 196);
    logoLayer.opacity = 0.6;
    [self.view.layer addSublayer:logoLayer];
    
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)];
    maskView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:maskView];
    
    cloud1Layer = [CALayer layer];
    UIImage *cloud1Image = [UIImage imageNamed:@"cloud1"];
    cloud1Layer.contents = (__bridge id)[cloud1Image CGImage];
    cloud1Layer.position = CGPointZero;
    cloud1Layer.anchorPoint = CGPointMake(0.5, 0.5);
    cloud1Layer.bounds = CGRectMake(0, 0, 181, 80);
    cloud1Layer.frame = CGRectMake(200, 300, 181, 80);
    cloud1Layer.name = @"cloud1";
    cloud1Layer.opacity = 0.6;
    cloud1SwingAnimated = NO;
    [self performAnimation:cloud1Layer];
    [maskView.layer addSublayer:cloud1Layer];
    
    cloud2Layer = [CALayer layer];
    UIImage *cloud2Image = [UIImage imageNamed:@"cloud2"];
    cloud2Layer.contents = (__bridge id)[cloud2Image CGImage];
    cloud2Layer.position = CGPointZero;
    cloud2Layer.anchorPoint = CGPointMake(0.5, 0.5);
    cloud2Layer.bounds = CGRectMake(0, 0, 135, 58);
    cloud2Layer.frame = CGRectMake(400, 140, 135, 58);
    cloud2Layer.name = @"cloud2";
    cloud2SwingAnimated = NO;
    cloud2Layer.opacity = 0.6;
    [self performAnimation:cloud2Layer];
    [maskView.layer addSublayer:cloud2Layer];

    cloud3Layer = [CALayer layer];
    UIImage *cloud3Image = [UIImage imageNamed:@"cloud3"];
    cloud3Layer.contents = (__bridge id)[cloud3Image CGImage];
    cloud3Layer.position = CGPointZero;
    cloud3Layer.anchorPoint = CGPointMake(0.5, 0.5);
    cloud3Layer.bounds = CGRectMake(0, 0, 135, 59);
    cloud3Layer.frame = CGRectMake(740, 240, 135, 59);
    cloud3Layer.name = @"cloud3";
    cloud3Layer.opacity = 0.6;
    cloud3SwingAnimated = NO;
    [self performAnimation:cloud3Layer];
    [maskView.layer addSublayer:cloud3Layer];

    cloud4Layer = [CALayer layer];
    UIImage *cloud4Image = [UIImage imageNamed:@"cloud4"];
    cloud4Layer.contents = (__bridge id)[cloud4Image CGImage];
    cloud4Layer.position = CGPointZero;
    cloud4Layer.anchorPoint = CGPointMake(0.5, 0.5);
    cloud4Layer.bounds = CGRectMake(0, 0, 125, 54);
    cloud4Layer.frame = CGRectMake(790, 480, 125, 54);
    cloud4Layer.name = @"cloud4";
    cloud4Layer.opacity = 0.6;
    cloud4SwingAnimated = NO;
    [self performAnimation:cloud4Layer];
    [maskView.layer addSublayer:cloud4Layer];

    logoTextLayer = [CALayer layer];
    UIImage *academicImage = [UIImage imageNamed:@"yueluAcademic"];
    logoTextLayer.contents = (__bridge id)[academicImage CGImage];
    logoTextLayer.position = CGPointMake(0.0, 0.0);
    logoTextLayer.anchorPoint = CGPointMake(0.5, 0.5);
    logoTextLayer.bounds = CGRectMake(0, 0, 458, 458);
    logoTextLayer.frame = CGRectMake(283, 155, 458, 458);
    [maskView.layer addSublayer:logoTextLayer];
    
    UIImage *arrowImage = [UIImage imageNamed:@"upBtn"];
    upBtnImg = [[UIImageView alloc] initWithImage:arrowImage];
    upBtnImg.frame = CGRectMake(467, 700, 53, 29);
    upBtnImg.userInteractionEnabled = YES;
    upBtnAnimated = NO;
    [self upBtnAnimation:upBtnImg.layer];
    [maskView addSubview:upBtnImg];
    
    UITapGestureRecognizer *upImgTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideTopLayer:)];
    [upBtnImg addGestureRecognizer:upImgTap];
   
    isAddDirectionView = NO;
    isAnimation = NO;
    isHidden = NO;
    
}

-(void)performAnimation:(CALayer *)layer
{
    
    [layer pop_removeAllAnimations];
    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
   
    if ([[layer name] isEqualToString:@"cloud1"])
    {
        [POPAnimationManager decayObject:layer configAnimation:anim andAnimated:cloud1SwingAnimated];
        cloud1SwingAnimated = !cloud1SwingAnimated;
    }
    else if ([[layer name] isEqualToString:@"cloud2"])
    {
        [POPAnimationManager decayObject:layer configAnimation:anim andAnimated:cloud2SwingAnimated];
        cloud2SwingAnimated = !cloud2SwingAnimated;
    }
    else if ([[layer name] isEqualToString:@"cloud3"])
    {
        [POPAnimationManager decayObject:layer configAnimation:anim andAnimated:cloud3SwingAnimated];
        cloud3SwingAnimated = !cloud3SwingAnimated;
    }
    else if ([[layer name] isEqualToString:@"cloud4"])
    {
        [POPAnimationManager decayObject:layer configAnimation:anim andAnimated:cloud4SwingAnimated];
        cloud4SwingAnimated = !cloud4SwingAnimated;
    }
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            [self performAnimation:layer];
        }
    };
    
    [layer pop_addAnimation:anim forKey:@"Animation"];
}

-(void)upBtnAnimation:(CALayer *)layer
{
    [upBtnImg.layer pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    
    if (upBtnAnimated) {
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    }else{
        anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
    }
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    anim.duration = 1.0;
    upBtnAnimated = !upBtnAnimated;
    
    anim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
            [self upBtnAnimation:upBtnImg.layer];
        }
    };

    [upBtnImg.layer pop_addAnimation:anim forKey:@"Animation"];
}

-(void) hideTopLayer:(UIGestureRecognizer *) gesture
{
    [maskView.layer pop_removeAllAnimations];
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, -384.0)];
    anim.duration = 1.5;
    [anim setCompletionBlock:^(POPAnimation *anim, BOOL isFinish) {
        [self animationForMapAndLogo];
        [self addArticleDirectionView];
        [self addAnimForDirectionView];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SET_SCRILLVIEW_SCROLL_ENABLE" object:nil userInfo:nil];
    }];
    [maskView pop_addAnimation:anim forKey:@"centerAnimation"];
}

-(void) animationForMapAndLogo
{
    logoLayer.opacity = 1.0;
    mapLayer.opacity = 1.0;
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    anim.fromValue = [NSNumber numberWithFloat:0.6];
    anim.toValue = [NSNumber numberWithFloat:1.0];
    anim.duration = 2.0;
    anim.removedOnCompletion = NO;
    anim.autoreverses = NO;
    anim.repeatCount = 0;
    [logoLayer addAnimation:anim forKey:@"opacity"];
    [mapLayer addAnimation:anim forKey:@"opacity"];
    
}

-(void) addArticleDirectionView
{
    if (!isAddDirectionView)
    {
        isAddDirectionView = YES;
        directionViewArray = [[NSMutableArray alloc] init];
        for (int i = 0; i < ARTICLE_NUMBER; i++)
        {
            articleDirectionBlockView = [[ArticleDirectionBlockView alloc] initWithFrame:CGRectMake(articleArraySign[i][0], articleArraySign[i][1], 60, 60 + articleArraySign[i][2])];
            articleDirectionBlockView.articleNumber = i + 1;
            articleDirectionBlockView.lineHeight = articleArraySign[i][2];
            [articleDirectionBlockView setNeedsDisplay];
            articleDirectionBlockView.backgroundColor = [UIColor clearColor];
            [self.view addSubview:articleDirectionBlockView];
            [directionViewArray addObject:articleDirectionBlockView];
        }
    }
}

-(void) addAnimForDirectionView
{
    if (!isAnimation)
    {
        isAnimation = YES;
        isHidden = NO;
        POPBasicAnimation *anim = nil;
        for (ArticleDirectionBlockView *articleView in directionViewArray)
        {
            if ([articleView isHidden])
            {
                [articleView setHidden:FALSE];
            }
            [articleView.layer pop_removeAllAnimations];
            anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
            anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(articleView.center.x, articleView.center.y)];
            anim.toValue = [NSValue valueWithCGPoint:CGPointMake(articleView.center.x, articleView.center.y + 30)];
            [articleView.layer pop_addAnimation:anim forKey:@"Animation"];
        }
    }
    
}

-(void) hideAllArticleDirectionView
{
    if (!isHidden)
    {
        isAnimation = NO;
        isHidden = YES;
        for (ArticleDirectionBlockView *articleView in directionViewArray)
        {
            articleView.hidden = YES;
            articleView.frame = CGRectMake(articleView.frame.origin.x, articleView.frame.origin.y - 30, articleView.frame.size.width, articleView.frame.size.height);
        }
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
