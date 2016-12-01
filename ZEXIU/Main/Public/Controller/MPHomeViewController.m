//
//  MPHomeViewController.m
//  MobileProject
//
//  Created by wujunyang on 16/7/1.
//  Copyright © 2016年 wujunyang. All rights reserved.
//

#import "MPHomeViewController.h"

@implementation MPHomeViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
        
        self.tabBar.tintColor =RGB(182, 65, 65);
        
    }
    return self;
}


- (void)setupTabBarController {
    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =[self tabBarItemsAttributesForController];
    
    /// 设置控制器数组
    self.viewControllers =[self mpViewControllers];
    
    self.delegate = self;
//    self.moreNavigationController.navigationBarHidden = NO;
    //默认显示发现（home）页面
    self.selectedIndex = 1;
}


//控制器设置
- (NSArray *)mpViewControllers {
    DynamicsViewController *firstViewController = [[DynamicsViewController alloc] init];
    UINavigationController *firstNavigationController = [[MPBaseNavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    HomeViewController *secondViewController = [[HomeViewController alloc] init];
    UINavigationController *secondNavigationController = [[MPBaseNavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    SchoolFellowViewController *thirdViewController = [[SchoolFellowViewController alloc] init];
    UINavigationController *thirdNavigationController = [[MPBaseNavigationController alloc]
                                                   initWithRootViewController:thirdViewController];
    
    UINavigationController *fourthNavigationController = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateInitialViewController];
    
    NSArray *viewControllers = @[
                                 firstNavigationController,
                                 secondNavigationController,
                                 thirdNavigationController,
                                 fourthNavigationController
                                 ];
    return viewControllers;
}

//TabBar文字跟图标设置
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *firstTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"动态",
                                                 CYLTabBarItemImage : @"home_normal",
                                                 CYLTabBarItemSelectedImage : @"home_highlight",
                                                 };
    NSDictionary *secondTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"发现",
                                                  CYLTabBarItemImage : @"mycity_normal",
                                                  CYLTabBarItemSelectedImage : @"mycity_highlight",
                                                  };
    NSDictionary *thirdTabBarItemsAttributes = @{
                                                 CYLTabBarItemTitle : @"校友",
                                                 CYLTabBarItemImage : @"message_normal",
                                                 CYLTabBarItemSelectedImage : @"message_highlight",
                                                 };
    NSDictionary *fourthTabBarItemsAttributes = @{
                                                  CYLTabBarItemTitle : @"我",
                                                  CYLTabBarItemImage : @"account_normal",
                                                  CYLTabBarItemSelectedImage : @"account_highlight"
                                                  };
    NSArray *tabBarItemsAttributes = @[
                                       firstTabBarItemsAttributes,
                                       secondTabBarItemsAttributes,
                                       thirdTabBarItemsAttributes,
                                       fourthTabBarItemsAttributes
                                       ];
    return tabBarItemsAttributes;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
    BOOL isHomeVC = [viewController.topViewController isKindOfClass:[HomeViewController class]];
    if (!isHomeVC) {
        NSLog(@"你点击了1，3，4，需要验证登录");
//        return NO;
    }
    return YES;
}
@end
