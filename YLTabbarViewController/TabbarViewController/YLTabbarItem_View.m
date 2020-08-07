//
//  YLTabbarItem_View.m
//  YLTabbarViewController
//
//  Created by mac on 2020/6/30.
//  Copyright © 2020 fanyoule. All rights reserved.
//

#import "YLTabbarItem_View.h"
#import "Masonry.h"
@implementation YLTabbarItem_View
-(instancetype)initWithTitle:(NSString *)title withFont:(UIFont *)font withTitleColor:(UIColor *)title_color withTitleSelectColor:(UIColor *)title_selectColor withNormalImageNamen:(NSString *)normal_Icon withSelectedImageName:(NSString *)selected_icon{
    
    self = [super init];
    if (self) {
//        self.backgroundColor = UIColor.whiteColor;
        self.title = title;
        self.F_title = font;
        self.C_title = title_color;
        self.C_selectTitle = title_selectColor;
        self.normal_icon = [UIImage imageNamed:normal_Icon];
        self.selected_icon = [UIImage imageNamed:selected_icon];
        [self creatUI];

    }
    
    return self;
    
}
-(void)creatUI{
    _is_selected = NO;
    [self addSubview:self.M_icon];
    [self.M_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self).mas_offset(10);
    }];
    [self addSubview:self.L_title];
    self.L_title.textColor = self.C_title;
    [self.L_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.top.mas_equalTo(self.M_icon.mas_bottom).mas_offset(4);
        make.height.mas_equalTo(@20);
    }];

    
}


-(void)setTitle:(NSString *)title{
    _title = title;
    self.L_title.text = _title;
}
-(void)setNormal_icon:(UIImage *)normal_icon{
    _normal_icon = normal_icon;
    self.M_icon.image = _normal_icon;
}
-(void)setSelected_icon:(UIImage *)selected_icon{
    _selected_icon = selected_icon;
    if (self.is_selected) {
        self.M_icon.image = _selected_icon;
    }
}
-(void)setIs_selected:(BOOL)is_selected{
    _is_selected = is_selected;
    if (_is_selected) {
        self.M_icon.image = _selected_icon;
        self.L_title.textColor = self.C_selectTitle;
    }else{
        self.M_icon.image = _normal_icon;
        self.L_title.textColor = self.C_title;

    }
    
}

-(UILabel *)L_title{
    if (!_L_title) {
        _L_title = [[UILabel alloc]init];
        _L_title.textColor = self.C_title?self.C_title:UIColor.blueColor;
        _L_title.font = self.F_title?self.F_title:[UIFont systemFontOfSize:14];
        _L_title.textAlignment = NSTextAlignmentCenter;
    }
    return _L_title;
}
-(UIImageView *)M_icon{
    if (!_M_icon) {
        _M_icon = [[UIImageView alloc]init];
        _M_icon.contentMode =UIViewContentModeScaleAspectFit;
    }
    return _M_icon;;
}







@end
