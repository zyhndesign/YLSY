//
//  POPAnimationManager.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-22.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../libs/pop/POPBasicAnimation.h"

@interface POPAnimationManager : NSObject

+(void)decayObject:(CALayer*)layer configAnimation:(POPBasicAnimation *)animation  andAnimated:(BOOL)animated;
@end
