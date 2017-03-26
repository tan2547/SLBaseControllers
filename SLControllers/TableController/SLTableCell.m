//
//  SLTableCell.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/26.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLTableCell.h"

@implementation SLTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)bindData:(NSMutableDictionary *)data{
    NSLog(@"%@,绑定数据字典:%@",NSStringFromClass([self class]),data);
}
@end
