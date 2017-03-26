//
//  SLTableController.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLController.h"

@interface SLTableController : SLController
/**
 *  布局数组
 *  二维
 *  存放动态字典
 */
@property (nonatomic,strong) NSMutableArray <NSMutableArray<NSMutableDictionary *> *>*layoutArray;

@end
