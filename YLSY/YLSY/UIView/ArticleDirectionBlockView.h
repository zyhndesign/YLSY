//
//  ArticleDirectionBlockView.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-29.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleDirectionBlockView : UIView
{
    int articleNumber;
    int lineHeight;
    CATextLayer *numLayer;
}

@property (nonatomic) int articleNumber;
@property (nonatomic) int lineHeight;

@end
