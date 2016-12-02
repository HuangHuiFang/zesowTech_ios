//
//  MoviePlayerViewController.m
//  ZEXIU
//
//  Created by 刘文利 on 16/12/1.
//  Copyright © 2016年 刘文利. All rights reserved.
//

#import "MoviePlayerViewController.h"
#import "ZFPlayer.h"
@interface MoviePlayerViewController ()
@property (strong, nonatomic) ZFPlayerView *playerView;
@property (strong, nonatomic) ZFPlayerModel *playerModel;

@end

@implementation MoviePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playerView = [[ZFPlayerView alloc]init];
    // 指定控制层(可自定义)
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc]init];
    //设置控制层和播放模式
    [self.playerView playerControlView:controlView playerModel:self.playerModel];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Getter
- (ZFPlayerModel *)playerModel {
    if (!_playerModel) {
    
    }
    return _playerModel;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
