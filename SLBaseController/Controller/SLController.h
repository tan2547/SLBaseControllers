//
//  SLController.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLControllerLiftCircle<NSObject>

@optional
/**
 *  准备子视图
 */
- (void)sl_prepareSubView;

/**
 *  准备布局数据
 */
- (void)sl_prepareLayoutArray;

@end

@interface SLController : UIViewController<SLControllerLiftCircle>

@end