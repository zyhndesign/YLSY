//
//  ArticleModel.h
//  YLSY
//
//  Created by 工业设计中意（湖南） on 14-8-27.
//  Copyright (c) 2014年 中意工业设计（湖南）有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject
{
    NSString *imagePath;
    NSString *timeText;
    NSString *titleText;
    NSString *contentText;
}

@property (nonatomic) NSString *imagePath;
@property (nonatomic) NSString *timeText;
@property (nonatomic) NSString *titleText;
@property (nonatomic) NSString *contentText;
@end
