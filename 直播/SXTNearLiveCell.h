//
//  SXTNearLiveCell.h
//  
//
//  Created by 大欢 on 16/8/25.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

@interface SXTNearLiveCell : UICollectionViewCell

@property (nonatomic, strong) YKNearLives * live;

- (void)showAnimation;

@end
