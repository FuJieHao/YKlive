//
//  KTTabBarController.m
//  KTAiXianFeng
//
//  Created by WangBiao on 2016/10/11.
//  Copyright © 2016年 lsrain. All rights reserved.
//

#import "KTTabBarController.h"

#import "KTNavigationViewController.h"

@interface KTTabBarController ()


@end

@implementation KTTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.translucent = NO;

//    tab_launch
    //loadChildViewControllerWithClassName:对应的VC
    UIViewController *first = [self loadChildViewControllerWithClassName:@"KTHotLiveTableViewController" andTitle:@"热门" andImageName:@"tab_live"];
    
    UIViewController *second = [self loadChildViewControllerWithClassName:@"KTNearViewController" andTitle:@"附近" andImageName:@"tab_me"];
    
    UIViewController *third = [self loadChildViewControllerWithClassName:@"YKZhiBoViewController" andTitle:@"直播" andImageName:@"tab_launch"];
    
    self.viewControllers = @[first,second,third];
    
}

- (UIViewController *)loadChildViewControllerWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    Class class = NSClassFromString(className);
    
    UIViewController *vc = [[class alloc] init];
    
    return [self setupTabBarItemAndNavigationControllerWithRootViewController:vc andTitle:title andImageName:imageName];
}

- (UIViewController *)loadChildViewControllerWithStoryboardName:(NSString *)sbName andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:nil];
    UIViewController *vc = [sb instantiateInitialViewController];
    
    return [self setupTabBarItemAndNavigationControllerWithRootViewController:vc andTitle:title andImageName:imageName];
}


- (UIViewController *)setupTabBarItemAndNavigationControllerWithRootViewController:(UIViewController *)viewController andTitle:(NSString *)title andImageName:(NSString *)imageName {
    
    viewController.title = title;
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_1", imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    KTNavigationViewController *nav = [[KTNavigationViewController alloc] initWithRootViewController:viewController];
    return nav;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
