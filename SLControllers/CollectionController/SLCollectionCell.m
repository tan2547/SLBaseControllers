//
//  SLCollectionCell.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/27.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLCollectionCell.h"

@implementation SLCollectionCell

- (void)bindData:(NSMutableDictionary *)data{
    NSLog(@"%@,绑定数据字典:%@",NSStringFromClass([self class]),data);
}

@end
