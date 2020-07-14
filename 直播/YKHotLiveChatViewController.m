//
//  YKHotLiveChatViewController.m
//  直播
//
//  Created by Mac on 16/10/28.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "YKHotLiveChatViewController.h"
#import "Creator.h"

#import "NHHeader.h"
#import "NHCarViews.h"
#import "NHPlaneViews.h"

#define NHBounds [UIScreen mainScreen].bounds.size

@interface YKHotLiveChatViewController ()

@property (weak, nonatomic) IBOutlet UIButton *iconImageView;

@property (nonatomic, weak) NHPresentFlower *flower;
@property (weak, nonatomic) IBOutlet UIButton *porsche;
@property (weak, nonatomic) IBOutlet UIButton *fighter;
@property (weak, nonatomic) IBOutlet UIButton *plane;
@property (weak, nonatomic) IBOutlet UIButton *flower_a;
@property (weak, nonatomic) IBOutlet UIButton *flower_b;

@end

@implementation YKHotLiveChatViewController

- (void)setLive:(Lives *)live {
    
    _live = live;
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageServerHost,live.creator.portrait]] forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    [self initTimer];
    
    self.iconImageView.layer.cornerRadius = 15;
    self.iconImageView.layer.masksToBounds = YES;
    
}

- (IBAction)porscheAction:(id)sender {
    NHCarViews *car = [NHCarViews loadCarViewWithPoint:CGPointZero];
    
    //数组中放CGRect数据，CGRect的x和y分别作为控制点的x和y，CGRect的width和height作为结束点的x和y
    //方法如下：数组内的每个元素代码一个控制点和结束点
    NSMutableArray *pointArrs = [[NSMutableArray alloc] init];
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 2;
    [pointArrs addObject:NSStringFromCGRect(CGRectMake(width, 300, width, 300))];
    //    pointArrs addObject:...添加更多的CGRect
    car.curveControlAndEndPoints = pointArrs;
    
    [car addAnimationsMoveToPoint:CGPointMake(0, 100) endPoint:CGPointMake(self.view.bounds.size.width +166, 500)];
    [self.view addSubview:car];
}


- (IBAction)fighterAction:(id)sender {
    NHFighterView *fighter = [NHFighterView loadFighterViewWithPoint:CGPointMake(10, 100)];
    //fighter.curveControlAndEndPoints 用法同carView一样
    [fighter addAnimationsMoveToPoint:CGPointMake(self.view.bounds.size.width, 60) endPoint:CGPointMake( -500, 600)];
    [self.view addSubview:fighter];
    
}


- (IBAction)planeAction:(id)sender {
    NHPlaneViews *plane = [NHPlaneViews loadPlaneViewWithPoint:CGPointMake(NHBounds.width + 232, 0)];
    //plane.curveControlAndEndPoints 用法同carView一样
    
    [plane addAnimationsMoveToPoint:CGPointMake(NHBounds.width, 100) endPoint:CGPointMake(-500, 410)];
    [self.view addSubview:plane];
}


- (IBAction)flowerAAction:(id)sender {
    if (_flower == nil) {
        [self addFlowerView];
    }else{
        _flower.effect = NHSendEffectSpring;
        //_flower.scaleValue = @[@4.2,@3.5,@1.2,@3.8,@3.3,@3.0,@2.0,@1.0];
        [_flower continuePresentFlowers];
    }
}


- (IBAction)flowerBAction:(id)sender {
    if (_flower == nil) {
        [self addFlowerView];
    }else{
        _flower.effect = NHSendEffectShake;
        //_flower.scaleValue = @[@4.2,@3.5,@1.2,@3.8,@3.3,@3.0,@2.0,@1.0];
        [_flower continuePresentFlowers];
    }
}


- (void)addFlowerView{
    NHPresentFlower *flower = [[NHPresentFlower alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 50)presentFlowerEffect:NHSendEffectShake];
    flower.autoHiddenTime = 5;
    [self.view addSubview:flower];
    _flower = flower;
}


@end
