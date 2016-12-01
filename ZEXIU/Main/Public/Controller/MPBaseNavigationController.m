//
//  MPBaseNavigationController.m
//  MobileProject
//
//  Created by wujunyang on 16/7/1.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPBaseNavigationController.h"

@implementation MPBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.修改导航栏上按钮标题的颜色
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barTintColor = RGB(0, 255, 0);
    [self.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:17],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        //第二级则隐藏底部Tab
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
