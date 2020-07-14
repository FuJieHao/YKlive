//
//  YKZhiBoViewController.m
//  直播
//
//  Created by Mac on 16/10/28.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "YKZhiBoViewController.h"
#import "YKLivePreView.h"

@interface YKZhiBoViewController ()


@end

@implementation YKZhiBoViewController

- (IBAction)startLive:(UIButton *)sender
{
    UIView *back = [[UIView alloc] initWithFrame:self.view.bounds];
    back.backgroundColor = [UIColor blackColor];
    [self.view addSubview:back];
    
    YKLivePreView *liveView = [[YKLivePreView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:liveView];
    
    [liveView startLive];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
