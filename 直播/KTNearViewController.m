//
//  KTNearViewController.m
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "KTNearViewController.h"
#import "SXTNearLiveCell.h"
#import "DataModels.h"

#import "YKHotBoFangViewController.h"

#define kItemSizeW 100
#define kMargin 5

@interface KTNearViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation KTNearViewController
{
    NSArray *_dataList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataList = [NSArray array];
    
    [self setupUI];
    
    [self loadJson];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor cyanColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor whiteColor];

    
    [collectionView registerNib:[UINib nibWithNibName:@"SXTNearLiveCell" bundle:nil] forCellWithReuseIdentifier:@"Near"];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat outInset = self.view.frame.size.width - 2 * kMargin;
    NSInteger count = outInset / kItemSizeW;
    NSInteger extraTotal = (NSInteger)(outInset - kMargin * (count - 1 ));
    
    CGFloat itemWH;
    
    if (extraTotal < count * kItemSizeW) {
        
        itemWH = extraTotal / count;
        
    } else {
        
        CGFloat extraWidth = extraTotal % kItemSizeW;
        itemWH = kItemSizeW + extraWidth / count;
    }
    
    return CGSizeMake(itemWH, itemWH + 25);
}


#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Near" forIndexPath:indexPath];
    
    cell.live = _dataList[indexPath.row];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YKHotBoFangViewController * playerVC = [[YKHotBoFangViewController alloc] init];
    
    playerVC.live = _dataList[indexPath.row];
    playerVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:playerVC animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SXTNearLiveCell * c = (SXTNearLiveCell *)cell;
    [c showAnimation];
}


- (void)loadJson {
    
    NSDictionary *dict = @{@"uid":@"85149891",
                           @"latitude":@"40.090562",
                           @"longitude":@"116.413353"};
    [[YinkeNetworking sharedToolsWithBaseUrl:0] requestURLString:YK_NearLive parameters:dict success:^(id responseObject) {
        YKNearPerson *model = [YKNearPerson modelObjectWithDictionary:responseObject];
        
        NSLog(@"==!!!!%@",responseObject);
        
        _dataList = model.lives;
        [self.collectionView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}



@end
