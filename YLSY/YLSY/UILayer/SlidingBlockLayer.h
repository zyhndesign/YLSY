//
//  SlidingBlockLayer.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-26.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SlidingBlockLayer : CALayer
{
    CATextLayer *timeTextLayer;
    int yearValue;
}

@property (nonatomic) int yearValue;

@end
