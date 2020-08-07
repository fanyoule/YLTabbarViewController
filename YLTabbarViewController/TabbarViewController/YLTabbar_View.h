//
//  YLTabbar_View.h
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YLTabbarItem_View.h"
NS_ASSUME_NONNULL_BEGIN

@protocol YLTabbarDelegate <NSObject>

-(void)YLTabbar_selectedIndex:(NSInteger)index;

@end


@interface YLTabbar_View : UIView
//tabbar
@property(nonatomic,readonly,strong)NSMutableArray * tabBarItems;
//标题
@property(nonatomic,copy)NSArray <NSString *>*titles;
//默认图标（UIImage 或者 NSString）
@property(nonatomic,strong)NSArray * itemImages;
//选中图标
@property(nonatomic,strong)NSArray * selectItemImages;
//默认标题颜色
@property(nonatomic,strong)UIColor * defColor;
//选中标题颜色
@property(nonatomic,strong)UIColor * tintColor;
//当前选中的小标
@property(nonatomic,assign)NSInteger selectIndex;
//当前选中的tabbar
@property(nonatomic,strong)YLTabbarItem_View * tabbarItem;
@property(nonatomic,weak)id<YLTabbarDelegate>delegate;

//创建方法
-(instancetype)initWithFrame:(CGRect)frame Titles:(NSArray<NSString *> *)titles itemImages:(NSArray *)itemImgs selectImages :(NSArray *)selectImages withTitleColor:(UIColor *)def_color withTitleSelectColor:(UIColor *)sel_color;
//设置角标
-(void)setBadge:(NSInteger )count index:(NSUInteger)index;


@end

NS_ASSUME_NONNULL_END
