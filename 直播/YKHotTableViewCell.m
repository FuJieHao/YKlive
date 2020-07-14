//
//  YKHotTableViewCell.m
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "YKHotTableViewCell.h"

@interface YKHotTableViewCell ()

@end

@implementation YKHotTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.zhubo.userInteractionEnabled = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gotoKanPian)];
    
    [self.zhubo addGestureRecognizer:pan];
}

- (void)gotoKanPian
{
    NSLog(@"xxx");
}

@end
