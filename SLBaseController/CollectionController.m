//
//  CollectionController.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/27.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "CollectionController.h"

@interface CollectionController ()

@end

@implementation CollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"集合";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sl_prepareLayoutArray{
    NSMutableArray *sectionArr1 = [NSMutableArray arrayWithCapacity:1];
    NSMutableArray *sectionArr2 = [NSMutableArray arrayWithCapacity:1];
    for (int i = 0; i<20; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
        [dic setObject:@(i) forKey:@"value"];
        [sectionArr1 addObject:dic];
        [sectionArr2 addObject:dic];
    }
    if (self.layoutArray.count > 0) {
        [self.layoutArray removeAllObjects];
    }
    [self.layoutArray addObject:sectionArr1];
    [self.layoutArray addObject:sectionArr2];
}

- (void)sl_afterBindCollectionCell:(SLCollectionCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:0.5];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionController *cl = [[CollectionController alloc]init];
    [self.navigationController pushViewController:cl animated:YES];
    NSLog(@"集合视图的点击处：section-%ld ### row:%ld",(long)indexPath.section,(long)indexPath.row);
    NSLog(@"集合视图的点击处：section-%ld ### item:%ld",(long)indexPath.section,(long)indexPath.item);
}

@end
