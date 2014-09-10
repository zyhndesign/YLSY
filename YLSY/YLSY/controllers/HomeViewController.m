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
    {840,125,10},{845,55,10},{885,62,20},{775,100,30},{590,100,30},
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
    
    maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [[UIColor clearColor] CGColor];
    maskLayer.position = CGPointMake(0.0, 0.0);
    maskLayer.anchorPoint = CGPointMake(0.5, 0.5);
    maskLayer.bounds = CGRectMake(0, 0, 1024, 768);
    maskLayer.frame = CGRectMake(0, 0, 1024, 768);
    [self.view.layer addSublayer:maskLayer];
    
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
    [maskLayer addSublayer:cloud1Layer];
    
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
    [maskLayer addSublayer:cloud2Layer];

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
    [maskLayer addSublayer:cloud3Layer];

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
    [maskLayer addSublayer:cloud4Layer];

    logoTextLayer = [CALayer layer];
    UIImage *academicImage = [UIImage imageNamed:@"yueluAcademic"];
    logoTextLayer.contents = (__bridge id)[academicImage CGImage];
    logoTextLayer.position = CGPointMake(0.0, 0.0);
    logoTextLayer.anchorPoint = CGPointMake(0.5, 0.5);
    logoTextLayer.bounds = CGRectMake(0, 0, 458, 458);
    logoTextLayer.frame = CGRectMake(283, 155, 458, 458);
    [maskLayer addSublayer:logoTextLayer];
    
    arrowLayer = [CALayer layer];
    UIImage *arrowImage = [UIImage imageNamed:@"downIcon1"];
    arrowLayer.contents = (__bridge id)[arrowImage CGImage];
    arrowLayer.position = CGPointMake(0.0, 0.0);
    arrowLayer.anchorPoint = CGPointMake(0.5, 0.5);
    arrowLayer.bounds = CGRectMake(0, 0, 45, 45);
    arrowLayer.frame = CGRectMake(467, 700, 45, 45);
    [maskLayer addSublayer:arrowLayer];
    
    /*
    articleMapLayer = [CALayer layer];
    articleMapLayer.contents = (__bridge id)[mapImage CGImage];
    articleMapLayer.position = CGPointMake(0.0, 0.0);
    articleMapLayer.anchorPoint = CGPointMake(0.5, 0.5);
    articleMapLayer.bounds = CGRectMake(0, 0, 1024, 768);
    articleMapLayer.frame = CGRectMake(0, 768, 1024, 768);
    [self.view.layer addSublayer:articleMapLayer];
    */
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

-(void) executeScrollMap:(float)position
{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(mapLayer.frame.origin.x + mapLayer.frame.size.width / 2, mapLayer.frame.origin.y + mapLayer.frame.size.height / 2)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(mapLayer.frame.origin.x + mapLayer.frame.size.width / 2, mapLayer.frame.origin.y + mapLayer.frame.size.height / 2 + position)];

    anim.duration = 0.2;
    
    [mapLayer pop_addAnimation:anim forKey:@"Animation"];
    [maskLayer pop_addAnimation:anim forKey:@"Animation"];
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
