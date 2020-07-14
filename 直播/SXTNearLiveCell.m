//
//  SXTNearLiveCell.m
//  
//
//  Created by 大欢 on 16/8/25.
//  Copyright © 2016年 大欢. All rights reserved.
//

#import "SXTNearLiveCell.h"
#import "Creator.h"

@interface SXTNearLiveCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headView;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation SXTNearLiveCell

- (void)showAnimation {
        //x和y的最终值为1
    if (self.live.isShow) {
        return;
    }
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);

    [UIView animateWithDuration:1 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        self.live.show = YES;
    }];
}

- (void)setLive:(YKNearLives *)live {
    
    _live = live;
    [self.headView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImageServerHost,live.creator.portrait]] placeholderImage:[UIImage imageNamed:@"default_room"]];
    
    NSLog(@"===================%@====%@",ImageServerHost,live.creator.portrait);
   
    self.distanceLabel.text = live.distance;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

@end
