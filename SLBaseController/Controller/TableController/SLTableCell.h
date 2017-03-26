//
//  SLTableCell.h
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLTableCell : UITableViewCell

/**
 *  数据绑定，若有子类如需扩展，覆盖之，视情况 super 调用
 */
- (void)bindData:(NSMutableDictionary *)data;

@end
