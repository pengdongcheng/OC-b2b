//
//  AppDelegate.m
//  OC-b2b
//
//  Created by 彭东成 on 16/8/23.
//  Copyright © 2016年 彭东成. All rights reserved.
//

#import "AppDelegate.h"
#import "B2bTabModle.h"
#import "B2BConfigure.h"
#import "B2BGlobalConfig.h"
#import "BaseJDWebviewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self setupUi];
    // Override point for customization after application launch.
    return YES;
}
-(void)setupUi{
    UITabBarController*tvc = [[UITabBarController alloc]init];
    B2bTabModle *model = [B2bTabModle mj_objectWithKeyValues:@{@"image":@"tb_index_off",@"selectedImage":@"tb_index_on",@"title":@"首页",@"isHideTitleBar":@(YES),@"url":@"main.html",@"pullToRefresh":@(YES),@"notScroll" :@(NO),@"viewControllerType":@"1",@"vcName":@"MainViewController"}];
    
    B2bTabModle *model1 = [B2bTabModle mj_objectWithKeyValues:@{@"image":@"tb_shop_off",@"selectedImage":@"tb_shop_on",@"title":@"供应商",@"isHideTitleBar":@(YES),@"url":@"supply_list.html",@"pullToRefresh":@(NO),@"notScroll" :@(YES),@"viewControllerType":@"1",@"vcName":@"SupplyViewController"}];
    
    
    B2bTabModle *model2 = [B2bTabModle mj_objectWithKeyValues:@{@"image":@"tb_cart_off",@"selectedImage":@"tb_cart_on",@"title":@"购物车",@"isHideTitleBar":@(NO),@"url":@"cart.html",@"pullToRefresh":@(YES),@"notScroll" :@(NO),@"viewControllerType":@"1",@"vcName":@"CarViewController"}];
    
    
    B2bTabModle *model3 = [B2bTabModle mj_objectWithKeyValues:@{@"image":@"tb_mine_off",@"selectedImage":@"tb_mine_on",@"title":@"个人中心",@"isHideTitleBar":@(NO),@"url":@"mine.html",@"pullToRefresh":@(NO),@"notScroll" :@(YES),@"viewControllerType":@"1",@"vcName":@"MineViewController"}];
    NSArray *viewConfig = @[model,model1,model2,model3];
    for (int i=0;i<viewConfig.count;i++) {
        B2bTabModle *tmp = viewConfig[i];
        NSDictionary *configDic = @{@"name":tmp.vcName,
                                    @"config":@{
                                            @"title":tmp.title,
                                            @"showBack":@(NO),
                                            @"hideTitleBar":@(tmp.isHideTitleBar),
                                            @"notScroll" :@(tmp.isNotScroll),
                                            @"showRight":@(NO),
                                            //@"rightBtnName":@"",
                                            @"url":tmp.url,
                                            @"urlType":@"file",
                                            @"initData":@{},
                                            @"pullToRefresh":@(tmp.isPullToRefresh)
                                            }};
        
        Class vcName = NSClassFromString(tmp.vcName);
        BaseJDWebviewController *bvc = vcName.new;
        UINavigationController *vc = [[UINavigationController alloc] initWithRootViewController:[bvc initWithDataByDic:configDic]];
//        vc.navigationItem.title = tmp.title;
        vc.tabBarItem.image = [UIImage imageNamed:tmp.image];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:tmp.selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.tag = i;
        [vc.tabBarItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
        [tvc addChildViewController:vc];
//        vc.title = tmp.title;
        NSLog(@"%d",i);
//        i++;
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = RGBA(251, 251, 251, 1);
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
