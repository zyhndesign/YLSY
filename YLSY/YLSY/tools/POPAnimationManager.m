//
//  POPAnimationManager.m
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-22.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import "POPAnimationManager.h"

@implementation POPAnimationManager

+(void)decayObject:(CALayer*)layer configAnimation:(POPBasicAnimation *)animation  andAnimated:(BOOL)animated
{
        if (animated)
        {
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(layer.frame.origin.x + layer.frame.size.width / 2, layer.frame.origin.y + layer.frame.size.height / 2)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(layer.frame.origin.x + layer.frame.size.width / 2 + 20, layer.frame.origin.y + layer.frame.size.height / 2)];;
            animation.duration = 2.0;
            
        }
        else
        {
            animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(layer.frame.origin.x + layer.frame.size.width / 2, layer.frame.origin.y + layer.frame.size.height / 2)];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(layer.frame.origin.x + layer.frame.size.width / 2 - 20, layer.frame.origin.y + layer.frame.size.height / 2)];
            animation.duration = 3.0;
        }
   
}
@end
