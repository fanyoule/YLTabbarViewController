//
//  AppDelegate.m
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "AppDelegate.h"
#import "YLTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[YLTabBarViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}





@end
