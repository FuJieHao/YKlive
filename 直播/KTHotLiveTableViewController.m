//
//  KTHotLiveTableViewController.m
//  直播
//
//  Created by Mac on 16/10/27.
//  Copyright © 2016年 haofujie. All rights reserved.
//

#import "KTHotLiveTableViewController.h"
#import "YKHotLive.h"
#import "Lives.h"
#import "YKHotTableViewCell.h"
#import "Creator.h"

#import "YKHotBoFangViewController.h"

@interface KTHotLiveTableViewController ()

@end

@implementation KTHotLiveTableViewController
{
    NSArray *_livesModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _livesModel = [NSArray array];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"YKHotTableViewCell" bundle:nil] forCellReuseIdentifier:@"HotLive"];
    
    self.tableView.rowHeight = 390;
    
    [self loadJson];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Lives *live = _livesModel[indexPath.row];
    YKHotBoFangViewController *vc = [[YKHotBoFangViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    vc.live = live;
//    [self presentViewController:vc animated:YES completion:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _livesModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YKHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotLive" forIndexPath:indexPath];
    
    NSString *zhuboImg = [NSString stringWithFormat:@"http://img.meelive.cn/%@",((Lives *)_livesModel[indexPath.row]).creator.portrait];
    
    [cell.zhubo sd_setImageWithURL:[NSURL URLWithString:zhuboImg] placeholderImage:[UIImage imageNamed:@"global_tab_bg"]];
    
    return cell;
}

- (void)loadJson
{
    [[YinkeNetworking sharedToolsWithBaseUrl:JsonServer] requestURLString:YK_HotLive parameters:nil success:^(id responseObject) {
        
        NSLog(@"===++++==%@",responseObject);
        YKHotLive *hotLiveModel =  [YKHotLive modelObjectWithDictionary:responseObject];
        NSArray *arr = hotLiveModel.lives;
        _livesModel = arr;
        
        [self.tableView reloadData];
        
    } falied:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

@end
