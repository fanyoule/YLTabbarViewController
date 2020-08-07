//
//  YLBaseViewController.h
//  YLTabbarViewController
//
//  Created by mac on 2020/7/6.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLBaseButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLBaseViewController : UIViewController
@property(nonatomic,strong)UIView * navgationSuperView;
@property(nonatomic,strong)UIView * navigationView;
@property(nonatomic,strong)UIView * lineView;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)YLBaseButton * leftBannerBt;

//导航条的标题
@property(nonatomic,copy,setter=setTitle:)NSString * __title;
//返回按钮的事件
-(void)onTouchBackBt:(YLBaseButton *)button;
//是否有导航栏
-(BOOL)hasNavView;


@end

NS_ASSUME_NONNULL_END
