//
//  YLTabBarViewController.h
//  YLTabbarViewController
//
//  Created by mac on 2020/7/1.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLTabbar_View.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLTabBarViewController : UITabBarController
@property(nonatomic,strong)YLTabbar_View * tabbars;
-(void)changeIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
