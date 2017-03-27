//
//  SLCollectionController.m
//  SLBaseController
//
//  Created by 谭春江 on 2017/3/27.
//  Copyright © 2017年 Sylar. All rights reserved.
//

#import "SLCollectionController.h"

@interface SLCollectionController ()

@end

@implementation SLCollectionController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    UICollectionViewFlowLayout *defaultLayout = [[UICollectionViewFlowLayout alloc]init];
    defaultLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    defaultLayout.itemSize = CGSizeMake(80, 80);
    
    if ([self respondsToSelector:@selector(sl_collectionDirection)]) {
        defaultLayout.scrollDirection = [self sl_collectionDirection];
    }
    
    if ([self respondsToSelector:@selector(sl_layoutOfCollection)]) {
        layout = [self sl_layoutOfCollection];
        return [super initWithCollectionViewLayout:layout];
    }
    return defaultLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    //注册cell以及reuseView
    [self registerCellsAndReuseViews];

    if ([self respondsToSelector:@selector(sl_prepareSubView)]) {
        [self sl_prepareSubView];
    }
    
    if ([self respondsToSelector:@selector(sl_prepareLayoutArray)]) {
        [self sl_prepareLayoutArray];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 注册cell
- (void)registerCellsAndReuseViews{
    if ([self respondsToSelector:@selector(sl_registerCollectionCell)]) {
        NSArray *array = [self sl_registerCollectionCell];
        for (NSString *name in array) {
            [self.collectionView registerClass:NSClassFromString(name) forCellWithReuseIdentifier:@"name"];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerCollectionNibCell)]) {
        NSArray *array = [self sl_registerCollectionNibCell];
        for (NSString *name in array) {
            [self.collectionView registerNib:[UINib nibWithNibName:name bundle:nil] forCellWithReuseIdentifier:name];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerHeaderReuseView)]) {
        NSArray *array = [self sl_registerHeaderReuseView];
        for (NSString *name in array) {
            [self.collectionView registerClass:NSClassFromString(name) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:name];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerHeaderNibReuseView)]) {
        NSArray *array = [self sl_registerHeaderNibReuseView];
        for (NSString *name in array) {
            [self.collectionView registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:name];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerFooterReuseView)]) {
        NSArray *array = [self sl_registerFooterReuseView];
        for (NSString *name in array) {
            [self.collectionView registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:name];
        }
    }
    if ([self respondsToSelector:@selector(sl_registerFooterNibReuseView)]) {
        NSArray *array = [self sl_registerFooterNibReuseView];
        for (NSString *name in array) {
            [self.collectionView registerNib:[UINib nibWithNibName:name bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:name];
        }
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.layoutArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.layoutArray objectAtIndex:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifer = NSStringFromClass([SLCollectionCell class]);
    if ([self respondsToSelector:@selector(sl_collectionCellReuseIdentiferAtIndexPath:)]) {
        reuseIdentifer = [self sl_collectionCellReuseIdentiferAtIndexPath:indexPath];
    }
    SLCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifer forIndexPath:indexPath];
    NSMutableArray *sectionArray = [self.layoutArray objectAtIndex:indexPath.section];
    NSMutableDictionary *dic = [sectionArray objectAtIndex:indexPath.row];
    [cell bindData:dic];
    if ([self respondsToSelector:@selector(sl_afterBindCollectionCell:atIndexPath:)]) {
        [self sl_afterBindCollectionCell:cell atIndexPath:indexPath];
    }
    return cell;
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
