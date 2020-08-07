//
//  YLTabbarItem_View.h
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLTabbarItem_View : UIView

-(instancetype)initWithTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)title_color      withTitleSelectColor:(UIColor *)title_selectColor       withNormalImageNamen:(NSString *)normal_Icon withSelectedImageName:(NSString *)selected_icon;


@property(nonatomic,copy)NSString * title;
@property(nonatomic,strong)UIColor * C_title;
@property(nonatomic,strong)UIColor * C_selectTitle;
@property(nonatomic,strong)UIFont * F_title;
@property(nonatomic,strong)UIImage * normal_icon;
@property(nonatomic,strong)UIImage * selected_icon;




@property(nonatomic,strong)UIImageView * M_icon;
@property(nonatomic,strong)UILabel * L_title;


@property(nonatomic,assign)BOOL is_selected;



@end

NS_ASSUME_NONNULL_END
